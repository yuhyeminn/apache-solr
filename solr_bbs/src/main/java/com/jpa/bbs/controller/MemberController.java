package com.jpa.bbs.controller;

import com.jpa.bbs.domain.Member;
import com.jpa.bbs.dto.MemberDTO;
import com.jpa.bbs.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.support.SessionStatus;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RestController
@RequiredArgsConstructor
public class MemberController {

    private final MemberService memberService;

    //회원 가입
    @PostMapping("/member")
    public Map<String, Object> register(@RequestParam MemberDTO memberDTO){
        Map<String, Object> result = new HashMap<String, Object>();

        try{
            //이메일 가입
            //이미 가입된 회원인지 확인
            Member m = memberService.getOneMember(memberDTO.getMemberEmail());

            if(m.getMemberEmail() == null || "".equals(m.getMemberEmail())){
                //회원 등록
                memberService.registerMember(memberDTO);
                result.put("complete", true);
            }else{
                result.put("complete",false);
            }

        }catch(Exception e){
            throw new RuntimeException("회원가입 오류");
        }

        return result;
    }

    //로그인
    @PostMapping("/member/login")
    public Map<String, Object> login(@RequestParam String email, @RequestParam String password, HttpSession session){
        Map<String, Object> result = new HashMap<String, Object>();
        try{

            //이미 가입된 회원인지 확인
            Member m = memberService.getOneMember(email);

            boolean complete = false;
            String msg = "";

            if(m.getMemberEmail() == null) {
                msg = "존재하지 않는 회원입니다.";
            }
            else{
                //비밀번호 일치 확인(암호화 작업 완료)
                if(memberService.matchPassword(password, m.getPassword())){
                    complete = true;
                    msg = m.getMemberName() + "님 안녕하세요.";
                    //세션에 저장
                    session.setAttribute("memberLoggedIn", m);
                }else{
                    msg = "비밀번호가 일치하지 않습니다.";
                }
            }

            result.put("complete",complete);
            result.put("msg",msg);

        }catch(Exception e){
            throw new RuntimeException("로그인 오류");
        }
        return result;
    }


}

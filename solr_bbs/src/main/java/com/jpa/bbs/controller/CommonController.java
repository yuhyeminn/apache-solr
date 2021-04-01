package com.jpa.bbs.controller;

import com.jpa.bbs.dto.BoardDTO;
import com.jpa.bbs.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class CommonController {

    private final BoardService boardService;

    @RequestMapping("/")
    public String main(Model model){
        return "redirect:/board";
    }

    @RequestMapping("/board_write")
    public String test3(){
        return "board/board_write";
    }

    @RequestMapping("/board_modify")
    public String test4(){
        return "board/board_modify";
    }

    //로그아웃
    @RequestMapping("/member/logout")
    public String logout(SessionStatus sessionStatus, HttpSession session) {

        if(session != null) {
            session.invalidate();
        }

        return "redirect:/board"; // 메인화면으로 리다이렉트
    }
}

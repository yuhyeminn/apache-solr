package com.jpa.bbs.service;

import com.jpa.bbs.domain.Member;
import com.jpa.bbs.dto.MemberDTO;
import com.jpa.bbs.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{

    private final MemberRepository memberRepository;
    private final ModelMapper modelMapper;
    private final PasswordEncoder passwordEncoder;

    @Override
    public Member getOneMember(String email) {
        Member m;

        m = memberRepository.getByMemberEmail(email);
        if(m==null) m = new Member();

        return m;
    }

    @Override
    public void registerMember(MemberDTO memberDTO) {
        //패스워드 암호화
        String encryptedPassword = passwordEncoder.encode(memberDTO.getPassword());
        memberDTO.setPassword(encryptedPassword);

        Member m = modelMapper.map(memberDTO, Member.class);

        memberRepository.save(m);
    }

    @Override
    public boolean matchPassword(String password1, String password2) {
        return passwordEncoder.matches(password1, password2);
    }
}

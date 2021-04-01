package com.jpa.bbs.service;

import com.jpa.bbs.domain.Member;
import com.jpa.bbs.dto.MemberDTO;

public interface MemberService {
    Member getOneMember(String email);

    void registerMember(MemberDTO m);

    boolean matchPassword(String password, String password1);
}

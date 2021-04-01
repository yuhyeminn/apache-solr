package com.jpa.bbs.dto;

import lombok.Data;

import javax.persistence.*;

@Data
public class MemberDTO {
    private long memberId;
    private String password;
    private String memberName;
    private String memberEmail;
}

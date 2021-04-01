package com.jpa.bbs.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Data
public class BoardDTO {

    private long boardNo;
    private MemberDTO boardWriter;
    private String boardTitle;
    private String boardContent;
    @JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
    private Date enrollDate;
    private String originalFileName;
    private String renamedFileName;
}

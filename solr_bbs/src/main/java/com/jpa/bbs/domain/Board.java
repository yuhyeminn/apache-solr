package com.jpa.bbs.domain;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Date;

@Entity
@Data
public class Board {

    @Column(name = "board_no")
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long boardNo;

    @ManyToOne
    @JoinColumn(name = "member_id")
    private Member boardWriter;

    @Column(name = "board_title")
    private String boardTitle;
    @Column(name = "board_content")
    private String boardContent;
    @Column(name = "enroll_date")
    private Date enrollDate = new Date();
    @Column(name = "original_file_name")
    private String originalFileName;
    @Column(name = "renamed_file_name")
    private String renamedFileName;
}

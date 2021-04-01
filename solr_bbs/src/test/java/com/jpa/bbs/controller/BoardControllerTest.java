package com.jpa.bbs.controller;

import com.jpa.bbs.domain.Board;
import com.jpa.bbs.domain.Member;
import com.jpa.bbs.repository.BoardRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class BoardControllerTest {
    @Autowired
    BoardRepository boardRepository;

    //게시글 데이터 등록
    @Test
    public void enrollPost(){
        Member m = new Member();
        m.setMemberId(1);
        Board b = new Board();
        b.setBoardContent("테스트2");
        b.setBoardTitle("테스트2");
        b.setBoardWriter(m);
        b.setOriginalFileName("test.jpg");
        b.setRenamedFileName("test.jpg");
        boardRepository.save(b);
    }
}

package com.jpa.bbs.service;

import com.jpa.bbs.domain.Board;
import com.jpa.bbs.dto.BoardDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface BoardService {
    Page<BoardDTO> getAllBoard(Pageable pageable);

    BoardDTO getOneBoard(long boardNo);

    BoardDTO enrollBoard(Board board);

    BoardDTO updateBoard(BoardDTO olderBoard);

    void deleteBoard(long boardNo);
}

package com.jpa.bbs.service;

import com.jpa.bbs.domain.Board;
import com.jpa.bbs.dto.BoardDTO;
import com.jpa.bbs.repository.BoardRepository;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Transactional
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {

    private final BoardRepository boardRepository;
    private final ModelMapper modelMapper;

    @Override
    public Page<BoardDTO> getAllBoard(Pageable pageable) {
        Page<Board> boardPage = boardRepository.findAll(pageable);
        // List<Board> -> List<BoardDTO>로 매핑할 경우
        // List<BoardDTO> result = boardPage.stream().map(b -> modelMapper.map(b,BoardDTO.class)).collect(Collectors.toList());
        Page<BoardDTO> result = boardPage.map(b -> modelMapper.map(b,BoardDTO.class));
        return result;
    }

    @Override
    public BoardDTO getOneBoard(long boardNo) {
        Board b = boardRepository.getOne(boardNo);
        return modelMapper.map(b, BoardDTO.class);
    }

    @Override
    public BoardDTO enrollBoard(Board board) {
        Board b = boardRepository.save(board);
        return modelMapper.map(b, BoardDTO.class);
    }

    @Override
    public BoardDTO updateBoard(BoardDTO olderBoard) {
        Board b = boardRepository.save(modelMapper.map(olderBoard, Board.class));
        return modelMapper.map(b, BoardDTO.class);
    }

    @Override
    public void deleteBoard(long boardNo) {
        boardRepository.deleteById(boardNo);
    }

}

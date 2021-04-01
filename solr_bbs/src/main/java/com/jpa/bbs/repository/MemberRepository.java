package com.jpa.bbs.repository;

import com.jpa.bbs.domain.Member;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MemberRepository extends JpaRepository<Member, Long> {

    Member getByMemberEmail(String email);
}

package com.medovoy.resume.repository;

import com.medovoy.resume.entity.Profile;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

public interface ProfileRepository extends JpaRepository<Profile, Long> {


    List<Profile> findAll();


    List<Profile> findAllByCompletedFalseAndCreatedBefore(Timestamp oldDate);


    Profile findByUid(String uid);

    Profile findByEmail(String email);

    Profile findByPhone(String phone);

    Profile findByUidOrEmailOrPhone(String uid, String email, String phone);

    int countByUid(String uid);

    Page<Profile> findAllByCompletedTrue(Pageable pageable);

    List<Profile> findByCompletedFalseAndCreatedBefore(Date created);

    Profile findById(Long id);
}

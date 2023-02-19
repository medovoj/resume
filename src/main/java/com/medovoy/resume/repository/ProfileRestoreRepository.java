package com.medovoy.resume.repository;

import com.medovoy.resume.entity.ProfileRestore;
import org.springframework.data.repository.CrudRepository;

public interface ProfileRestoreRepository extends CrudRepository<ProfileRestore, String> {


    ProfileRestore findByToken(String token);

    ProfileRestore findByProfileId(String id);

}

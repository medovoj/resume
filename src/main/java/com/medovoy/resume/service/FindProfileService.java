package com.medovoy.resume.service;

import com.medovoy.resume.entity.Profile;
import org.elasticsearch.common.Nullable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface FindProfileService {

    Profile findByUid(String uid);

    Page<Profile> findAll(Pageable pageable);

    Iterable<Profile> findAllForIndexing();

    Page<Profile> findBySearchQuery(String query, Pageable pageable);

    void restoreAccess( String anyUnigueId);

    @Nullable
    Profile findByRestoreToken(String token);
}

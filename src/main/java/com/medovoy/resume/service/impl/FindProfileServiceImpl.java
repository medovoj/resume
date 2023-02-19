package com.medovoy.resume.service.impl;

import com.medovoy.resume.component.DataBuilder;
import com.medovoy.resume.entity.Profile;
import com.medovoy.resume.entity.ProfileRestore;
import com.medovoy.resume.exception.CantCompleteClientRequestException;
import com.medovoy.resume.model.CurrentProfile;
import com.medovoy.resume.repository.ProfileRepository;
import com.medovoy.resume.repository.ProfileRestoreRepository;
import com.medovoy.resume.repository.search.ProfileSearchRepository;
import com.medovoy.resume.service.FindProfileService;
import com.medovoy.resume.service.NotificationManagerService;
import com.medovoy.resume.util.SecurityUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionSynchronizationAdapter;
import org.springframework.transaction.support.TransactionSynchronizationManager;

import java.util.List;

@Service
public class FindProfileServiceImpl implements FindProfileService, UserDetailsService {
    private static final Logger LOGGER = LoggerFactory.getLogger(FindProfileServiceImpl.class);
    @Autowired
    ProfileRepository profileRepository;

    @Autowired
    ProfileSearchRepository profileSearchRepository;

    @Autowired
    ProfileRestoreRepository profileRestoreRepository;

    @Autowired
    NotificationManagerService notificationManagerService;

    @Autowired
    DataBuilder dataBuilder;

    @Value("${application.host}")
    private String appHost;

    @Override
    public Profile findByUid(String uid) {
        return profileRepository.findByUid(uid);
    }

    @Override
    public Page<Profile> findAll(Pageable pageable) {
        return profileRepository.findAll(pageable);
    }

    @Override
    @Transactional
    public Iterable<Profile> findAllForIndexing() {
        Iterable<Profile> all = profileRepository.findAll();
        for(Profile p : all) {
            p.getSkills().size();
            p.getCertificates().size();
            p.getLanguages().size();
            p.getPractices().size();
            p.getCourses().size();
        }
        return all;
    }

    @Override
    public Page<Profile> findBySearchQuery(String query, Pageable pageable) {
        return profileSearchRepository.findByObjectiveLikeOrSummaryLikeOrPracticesCompanyLikeOrPracticesPositionLike(
                query, query, query, query, pageable);
    }

    @Override
    @Transactional
    public void restoreAccess(String anyUnigueId) {
        Profile profile = profileRepository.findByUidOrEmailOrPhone(anyUnigueId, anyUnigueId, anyUnigueId);
        if (profile != null) {
            ProfileRestore restore = profileRestoreRepository.findByProfileId(profile.getUid());//<------------getId()
            if (restore == null) {
                restore = new ProfileRestore();
                restore.setProfile(profile);
            }
            restore.setToken(SecurityUtil.generateNewRestoreAccessToken());
            profileRestoreRepository.save(restore);
            sentRestoreLinkNotificationIfTransactionSuccess(profile, restore);
        } else {
            LOGGER.error("Profile not found by anyIdAccount:" + anyUnigueId);
        }
    }

    protected void sentRestoreLinkNotificationIfTransactionSuccess(final Profile profile, ProfileRestore restore){
        final String restoreLink = dataBuilder.buildRestoreAccessLink(appHost, restore.getToken());
        TransactionSynchronizationManager.registerSynchronization(new TransactionSynchronizationAdapter() {
            @Override
            public void afterCommit() {
                notificationManagerService.sendRestoreAccessLink(profile, restoreLink);
            }
        });
    }

    @Override
    @Transactional
    public Profile findByRestoreToken(String token) {
        ProfileRestore restore = profileRestoreRepository.findByToken(token);
        if (restore == null) {
            throw new CantCompleteClientRequestException("Invalid token");
        }
        profileRestoreRepository.delete(restore);
        return restore.getProfile();
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Profile profile = findProfile(username);
        if (profile != null) {
            return new CurrentProfile(profile);
        } else {
            LOGGER.error("Profile not found by " + username);
            throw new UsernameNotFoundException("Profile not found by " + username);
        }
    }

    private Profile findProfile(String anyUnigueId) {
        Profile profile = profileRepository.findByUid(anyUnigueId);
        if (profile == null) {
            profile = profileRepository.findByEmail(anyUnigueId);
            if (profile == null) {
                profile = profileRepository.findByPhone(anyUnigueId);
            }
        }
        return profile;
    }


}

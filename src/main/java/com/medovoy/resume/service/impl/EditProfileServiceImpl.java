package com.medovoy.resume.service.impl;

import com.medovoy.resume.entity.Profile;
import com.medovoy.resume.entity.Skill;
import com.medovoy.resume.entity.SkillCategory;
import com.medovoy.resume.exception.CantCompleteClientRequestException;
import com.medovoy.resume.form.SignUpForm;
import com.medovoy.resume.model.CurrentProfile;
import com.medovoy.resume.repository.ProfileRepository;
import com.medovoy.resume.repository.SkillCategoryRepository;
import com.medovoy.resume.repository.search.ProfileSearchRepository;
import com.medovoy.resume.service.EditProfileService;
import com.medovoy.resume.util.DataUtil;
import org.apache.commons.collections4.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionSynchronizationAdapter;
import org.springframework.transaction.support.TransactionSynchronizationManager;
import org.springframework.web.multipart.MultipartFile;

import java.util.Collections;
import java.util.List;

@Service
public class EditProfileServiceImpl implements EditProfileService {

    private static final Logger LOGGER = LoggerFactory.getLogger(EditProfileServiceImpl.class);


    @Autowired
    ProfileRepository profileRepository;

    @Autowired
    SkillCategoryRepository skillCategoryRepository;

    @Autowired
    ProfileSearchRepository profileSearchRepository;

    @Value("${generate.uid.suffix.length}")
    private int generateUidSuffixLength;

    @Value("${generate.uid.alphabet}")
    private String generateUidAlphabet;

    @Value("${generate.uid.max.try.count}")
    private int maxTryCountToGenerateUid;


    @Override
    @Transactional
    public Profile createNewProfile(SignUpForm signUpForm) {
        Profile profile = new Profile();
        profile.setUid(generateProfileUid(signUpForm));
        profile.setFirstName(DataUtil.capitalizeName(signUpForm.getFirstName()));
        profile.setLastName(DataUtil.capitalizeName(signUpForm.getLastName()));
        profile.setPassword(signUpForm.getPassword());
        profile.setCompleted(false);
        profileRepository.save(profile);
        registerCreateIndexProfileIfTransactionSuccess(profile);

        return profile;
    }

    private void registerCreateIndexProfileIfTransactionSuccess(final Profile profile) {
        TransactionSynchronizationManager.registerSynchronization(new TransactionSynchronizationAdapter() {
            @Override
            public void afterCommit() {
                LOGGER.info("New profile created: {}", profile.getUid());
                profile.setCertificates(Collections.EMPTY_LIST);
                profile.setPractices(Collections.EMPTY_LIST);
                profile.setLanguages(Collections.EMPTY_LIST);
                profile.setSkills(Collections.EMPTY_LIST);
                profile.setCourses(Collections.EMPTY_LIST);
                profileSearchRepository.save(profile);
                LOGGER.info("New profile index created: {}", profile.getUid());
            }
        });
    }

    private String generateProfileUid(SignUpForm signUpForm) {
        String baseUid = DataUtil.generateProfileUid(signUpForm);
        String uid = baseUid;
        for (int i = 0; i < profileRepository.countByUid(uid); i++) {
            uid = DataUtil.regenerateUidWithRandomSuffix(baseUid, generateUidAlphabet, generateUidSuffixLength);
            if (i >= maxTryCountToGenerateUid){
                throw new CantCompleteClientRequestException("Cant generate unique uid for profile: " + baseUid + ": maxTryCountToGenerateUid");
            }
        }
        return uid;
    }

    @Override
    public List<Skill> listSkills(Long idProfile) {
        return profileRepository.findOne(idProfile).getSkills();
    }

    @Override
    public List<SkillCategory> listSkillCategories() {
        return skillCategoryRepository.findAll();
    }

    @Override
    @Transactional
    public void updateSkills(Long idProfile, List<Skill> updateData) {
        Profile profile = profileRepository.findOne(idProfile);
        if (CollectionUtils.isEqualCollection(updateData, profile.getSkills())){
            LOGGER.debug("Profile skills: nothing to update");
        } else {
            profile.setSkills(updateData);
            profileRepository.save(profile);
        }
    }

    @Override
    @Transactional
    public void updateProfileData(CurrentProfile currentProfile, Profile profileForm, MultipartFile uploadPhoto) {
        Profile loadedProfile = profileRepository.findOne(currentProfile.getId());
        List<String> oldProfilePhotos = Collections.EMPTY_LIST;
//        if (!uploadPhoto.isEmpty()) {
//            UploadResult uploadResult = imageProcessorService.processNewProfilePhoto(uploadPhoto);
//            deleteUploadedPhotosIfTransactionFailed(uploadResult);
//            oldProfilePhotos = Arrays.asList(new String[] { loadedProfile.getLargePhoto(), loadedProfile.getSmallPhoto() });
//            loadedProfile.updateProfilePhotos(uploadResult.getLargeUrl(), uploadResult.getSmallUrl());
//        }
//        int copiedFieldsCount = DataUtil.copyFields(profileForm, loadedProfile, ProfileDataFieldGroup.class);
//        boolean shouldProfileBeUpdated = !uploadPhoto.isEmpty() || copiedFieldsCount > 0;
//        if (shouldProfileBeUpdated) {
//            executeUpdateProfileData(currentProfile, loadedProfile, oldProfilePhotos);
//        }
    }
}

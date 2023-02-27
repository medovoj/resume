package com.medovoy.resume.service.impl;

import com.medovoy.resume.entity.*;
import com.medovoy.resume.exception.CantCompleteClientRequestException;
import com.medovoy.resume.form.SignUpForm;
import com.medovoy.resume.model.CurrentProfile;
import com.medovoy.resume.repository.LanguageRepository;
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

    @Autowired
    LanguageRepository languageRepository;



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
        return profile;
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
    public Profile findProfileById(CurrentProfile currentProfile) {
        return getProfile(currentProfile);
    }

    @Override
    public Contacts findContactsById(CurrentProfile currentProfile) {
        return getProfile(currentProfile).getContacts();
    }

    @Override
    @Transactional
    public void updateContacts(CurrentProfile currentProfile, Contacts contactsForm) {
        Profile loadedProfile = profileRepository.findOne(currentProfile.getId());
        int copiedFieldsCount = DataUtil.copyFields(contactsForm, loadedProfile.getContacts());
        boolean shouldProfileBeUpdated = copiedFieldsCount > 0;
        if (shouldProfileBeUpdated) {
            profileRepository.save(loadedProfile);
        } else {
            LOGGER.debug("Profile contacts not updated");
        }
    }

    @Override
    public List<Language> listLanguages(CurrentProfile currentProfile) {
        return languageRepository.findByProfileIdOrderByIdAsc(currentProfile.getId());

    }

    @Override
    @Transactional
    public void updateLanguages(CurrentProfile currentProfile, List<Language> languages) {
        Profile profile = profileRepository.findOne(currentProfile.getId());
        profile.setLanguages(languages);
        profileRepository.save(profile);
    }

    protected Profile getProfile(CurrentProfile currentProfile) {
        return profileRepository.findOne(currentProfile.getId());
    }

}

package com.medovoy.resume.service;

import com.medovoy.resume.entity.*;
import com.medovoy.resume.form.SignUpForm;
import com.medovoy.resume.model.CurrentProfile;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface EditProfileService {

    Profile createNewProfile(SignUpForm signUpForm);

    List<Skill> listSkills(Long idProfile);

    List<SkillCategory> listSkillCategories();

    void updateSkills(Long idProfile, List<Skill> skills);

    Profile findProfileById(CurrentProfile currentProfile);

    Contacts findContactsById(CurrentProfile currentProfile);

    void updateContacts(CurrentProfile currentProfile, Contacts contactsForm);

    List<Language> listLanguages(CurrentProfile currentProfile);

    void updateLanguages(CurrentProfile currentProfile, List<Language> items);
}

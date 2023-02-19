package com.medovoy.resume.service;

import com.medovoy.resume.entity.Profile;
import com.medovoy.resume.entity.Skill;
import com.medovoy.resume.entity.SkillCategory;
import com.medovoy.resume.form.SignUpForm;
import com.medovoy.resume.model.CurrentProfile;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface EditProfileService {

    Profile createNewProfile(SignUpForm signUpForm);

    List<Skill> listSkills(Long idProfile);

    List<SkillCategory> listSkillCategories();

    void updateSkills(Long idProfile, List<Skill> skills);

    void updateProfileData(CurrentProfile currentProfile, Profile profileForm, MultipartFile uploadPhoto);
}

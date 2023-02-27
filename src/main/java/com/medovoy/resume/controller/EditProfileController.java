package com.medovoy.resume.controller;
import com.medovoy.resume.entity.Contacts;
import com.medovoy.resume.entity.Profile;
import com.medovoy.resume.form.*;
import com.medovoy.resume.model.CurrentProfile;
import com.medovoy.resume.model.LanguageLevel;
import com.medovoy.resume.model.LanguageType;
import com.medovoy.resume.repository.ProfileRepository;
import com.medovoy.resume.service.EditProfileService;
import com.medovoy.resume.util.SecurityUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.util.EnumSet;


@Controller
public class EditProfileController {

	@Autowired
	private EditProfileService editProfileService;

	@Autowired
	private ProfileRepository profileRepository;

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String getEditProfile(Model model) {
		model.addAttribute("profileForm", editProfileService.findProfileById(SecurityUtil.getCurrentProfile()));
		return "edit/profile";
	}

	@RequestMapping(value = "/my-profile", method = RequestMethod.GET)
	public String getMyProfile(@AuthenticationPrincipal CurrentProfile currentProfile) {
		return "redirect:/" + currentProfile.getUsername();
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public String saveEditProfile(@Valid @ModelAttribute("profileForm") Profile profileForm, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			return "edit/profile";
		} else {
			try {
//				editProfileService.updateProfileData(SecurityUtil.getCurrentProfile(), profileForm, null);
				return "redirect:/edit/contacts";
			} catch (Exception e) {
//				bindingResult.addError(e.buildFieldError("profileForm"));
				return "edit/profile";
			}
		}}

	@RequestMapping(value = "/edit/contacts", method = RequestMethod.GET)
	public String getEditContactsProfile(Model model) {
		model.addAttribute("contactsForm", editProfileService.findContactsById(SecurityUtil.getCurrentProfile()));
		return "edit/contacts";
	}

	@RequestMapping(value = "/edit/contacts", method = RequestMethod.POST)
	public String saveEditContactsProfile(@Valid @ModelAttribute("contactsForm") Contacts contactsForm, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			return "edit/contacts";
		} else {
			editProfileService.updateContacts(SecurityUtil.getCurrentProfile(), contactsForm);
			return "redirect:/edit/skills";
		}
	}



	@RequestMapping(value = "/edit/skills", method = RequestMethod.GET)
	public String getEditTechSkills(Model model) {

		model.addAttribute("skillForm", new SkillForm(editProfileService.listSkills(SecurityUtil.getCurrentIdProfile())));
		model.addAttribute("skillCategories", editProfileService.listSkillCategories());
		return "edit/skills";
	}

	@RequestMapping(value = "/edit/skills", method = RequestMethod.POST)
	public String saveEditTechSkills(@Valid @ModelAttribute("skillForm") SkillForm form, BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()){
			model.addAttribute("skillCategories", editProfileService.listSkillCategories());
			return "edit/skills";
		}
		editProfileService.updateSkills(SecurityUtil.getCurrentIdProfile(), form.getItems());
		return "redirect:/mike-ross";
	}

	@RequestMapping(value = "/edit/info", method = RequestMethod.GET)
	public String getEditInfo(Model model) {

		model.addAttribute("infoForm", new InfoForm(profileRepository.findOne(1L).getInfo()));
		return "edit/info";
	}

	@RequestMapping(value = "/edit/info", method = RequestMethod.POST)
	public String saveEditInfo(@Valid @ModelAttribute("infoForm") InfoForm form, BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()){

			return "edit/info";
		}
		return "redirect:/mike-ross";
	}

	@RequestMapping(value = "/edit/certificates", method = RequestMethod.GET)
	public String getEditCertificates(Model model) {

		model.addAttribute("certificateForm", new CertificateForm(profileRepository.findOne(1L).getCertificates()));
		return "edit/certificates";
	}

	@RequestMapping(value = "/edit/certificates", method = RequestMethod.POST)
	public String saveEditCertificates(@Valid @ModelAttribute("certificateForm") CertificateForm certificateForm, BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()){

			return "edit/certificates";
		}
		return "redirect:/mike-ross";
	}

	@RequestMapping(value = "/edit/courses", method = RequestMethod.GET)
	public String getEditCourses(Model model) {

		model.addAttribute("courseForm", new CourseForm(profileRepository.findOne(1L).getCourses()));
		return "edit/courses";
	}

	@RequestMapping(value = "/edit/courses", method = RequestMethod.POST)
	public String saveEditCertificates(@Valid @ModelAttribute("courseForm") CourseForm courseForm, BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()){

			return "edit/courses";
		}
		return "redirect:/mike-ross";
	}


	@RequestMapping(value = "/edit/practices", method = RequestMethod.GET)
	public String getEditPractice(Model model) {

		model.addAttribute("practiceForm", new PracticeForm(profileRepository.findOne(1L).getPractices()));
		return "edit/practices";
	}

	@RequestMapping(value = "/edit/practices", method = RequestMethod.POST)
	public String saveEditPractice(@Valid @ModelAttribute("practiceForm") PracticeForm practiceForm, BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()){

			return "edit/practices";
		}
		return "redirect:/mike-ross";
	}


	@RequestMapping(value = "/edit/education", method = RequestMethod.GET)
	public String getEditEducation(Model model) {

		model.addAttribute("educationForm", new EducationForm(profileRepository.findOne(1L).getEducations()));
		return "edit/education";
	}

	@RequestMapping(value = "/edit/education", method = RequestMethod.POST)
	public String saveEditPractice(@Valid @ModelAttribute("educationForm") EducationForm educationForm, BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()){

			return "edit/education";
		}
		return "redirect:/mike-ross";
	}

	@RequestMapping(value = "/edit/languages", method = RequestMethod.GET)
	public String getEditLanguages(Model model) {
		model.addAttribute("languageForm", new LanguageForm(editProfileService.listLanguages(SecurityUtil.getCurrentProfile())));
		model.addAttribute("languageTypes",  EnumSet.allOf(LanguageType.class));
		model.addAttribute("languageLevels", EnumSet.allOf(LanguageLevel.class));
		return "edit/languages";
	}

	@RequestMapping(value = "/edit/languages", method = RequestMethod.POST)
	public String saveEditLanguages(@Valid @ModelAttribute("languageForm") LanguageForm form, BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			model.addAttribute("languageTypes",  EnumSet.allOf(LanguageType.class));
			model.addAttribute("languageLevels", EnumSet.allOf(LanguageLevel.class));
			return "edit/languages";
		} else {
			editProfileService.updateLanguages(SecurityUtil.getCurrentProfile(), form.getItems());
			return "redirect:/edit/hobbies";
		}
	}

	@RequestMapping(value = "/edit/hobbies", method = RequestMethod.GET)
	public String getEditHobbies(Model model) {

		return "edit/hobbies";
	}

	@RequestMapping(value = "/edit/hobbies", method = RequestMethod.POST)
	public String saveEditHobbies(BindingResult bindingResult) {
		if (bindingResult.hasErrors()){

			return "edit/language";
		}
		return "redirect:/mike-ross";
	}













}

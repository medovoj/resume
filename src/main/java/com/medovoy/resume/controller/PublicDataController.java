package com.medovoy.resume.controller;

import com.medovoy.resume.constants.Constants;
import com.medovoy.resume.constrain.annotation.FieldMatch;
import com.medovoy.resume.entity.*;
import com.medovoy.resume.form.SignUpForm;
import com.medovoy.resume.model.CurrentProfile;
import com.medovoy.resume.service.EditProfileService;
import com.medovoy.resume.service.FindProfileService;
import com.medovoy.resume.util.SecurityUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import static com.medovoy.resume.constants.Constants.MAX_PROFILES_PER_PAGE;


@Controller
public class PublicDataController {

    @Autowired
    private FindProfileService findProfileService;

    @Autowired
    private EditProfileService editProfileService;


    @RequestMapping(value = "/{uid}")
    public String profile(@PathVariable String uid, Model model) {
        Profile profile = findProfileService.findByUid(uid);
        if (profile == null) {
            return "profile-not-found";
        }

        Iterable<Skill> skills = profile.getSkills();
        Iterable<Language> languages = profile.getLanguages();
        Iterable<Hobby> hobbies = profile.getHobbies();
        Iterable<Certificate> certificates = profile.getCertificates();
        Iterable<Practice> practices = profile.getPractices();
        Iterable<Education> educations = profile.getEducations();
        Iterable<Course> courses = profile.getCourses();

        model.addAttribute("profile", profile);
        model.addAttribute("skills", skills);
        model.addAttribute("languages", languages);
        model.addAttribute("hobbies", hobbies);
        model.addAttribute("certificates", certificates);
        model.addAttribute("practices", practices);
        model.addAttribute("educations", educations);
        model.addAttribute("courses", courses);
        return "profile";

    }

    @RequestMapping(value = {"/welcome"})
    public String listAll(Model model) {
        Page<Profile> profiles = findProfileService.findAll(new PageRequest(0, MAX_PROFILES_PER_PAGE));
        model.addAttribute("profiles", profiles.getContent());
        model.addAttribute("page", profiles);
        return "welcome";
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String searchProfiles(@RequestParam(value = "query", required = false) String query, Model model,
                                 @PageableDefault(size = MAX_PROFILES_PER_PAGE) Pageable pageable) throws UnsupportedEncodingException {
        if (StringUtils.isBlank(query)) {
            return "redirect:/welcome";
        } else {
            Page<Profile> profiles = findProfileService.findBySearchQuery(query, pageable);
            model.addAttribute("profiles", profiles.getContent());
            model.addAttribute("page", profiles);
            model.addAttribute("query", URLDecoder.decode(query, "UTF-8"));
            return "search-results";
        }
    }

    @RequestMapping(value = "/fragment/more", method = RequestMethod.GET)
    public String moreProfiles(Model model,
                               @RequestParam(value = "query", required = false) String query,
                               @PageableDefault(size = MAX_PROFILES_PER_PAGE) Pageable pageable) throws UnsupportedEncodingException {
        Page<Profile> profiles = null;
        if (StringUtils.isNotBlank(query)) {
            profiles = findProfileService.findBySearchQuery(query, pageable);
        } else {
            profiles = findProfileService.findAll(pageable);
        }
        model.addAttribute("profiles", profiles.getContent());
        return "fragment/profile-items";
    }

    @RequestMapping(value = "/sign-in")
    public String signIn() {
        return "sign-in";
    }

    @RequestMapping(value = "/sign-up", method = RequestMethod.GET)
    public String signUp(Model model) {
        model.addAttribute("profileForm", new SignUpForm());
        return "sign-up";
    }

    @RequestMapping(value = "/sign-up", method = RequestMethod.POST)
    public String signUp(@Valid @ModelAttribute("profileForm") SignUpForm signUpForm, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "sign-up";
        } else {
            Profile profile = editProfileService.createNewProfile(signUpForm);
            return "redirect:/sign-up/success";
        }
    }

    @RequestMapping(value = "/sign-up/success", method = RequestMethod.GET)
    public String signUpSuccess(Model model) {

        return "sign-up-success";
    }

    @RequestMapping(value = "/error")
    public String error() {
        return "error";
    }

    @RequestMapping(value = "/sign-in-failed")
    public String signInFailed(HttpSession session) {
        if (session.getAttribute("SPRING_SECURITY_LAST_EXCEPTION") == null) {
            return "redirect:/sign-in";
        } else {
            return "sign-in";
        }
    }

    @RequestMapping(value = "/restore", method = RequestMethod.GET)
    public String getRestoreAccess() {
        return "restore";
    }

    @RequestMapping(value = "/restore/success", method = RequestMethod.GET)
    public String getRestoreSuccess() {
        return "restore-success";
    }

    @RequestMapping(value = "/restore", method = RequestMethod.POST)
    public String processRestoreAccess(@RequestParam("uid") String anyUnigueId) {
        findProfileService.restoreAccess(anyUnigueId);
        return "redirect:/restore/success";
    }

    @RequestMapping(value = "/restore/{token}", method = RequestMethod.GET)
    public String restoreAccess(@PathVariable("token") String token) {
        Profile profile = findProfileService.findByRestoreToken(token);
        SecurityUtil.authenticate(profile);
        return "redirect:/edit/password";
    }
}

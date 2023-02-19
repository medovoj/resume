package com.medovoy.resume.controller;

import com.medovoy.resume.constants.Constants;
import com.medovoy.resume.entity.*;
import com.medovoy.resume.model.CurrentProfile;
import com.medovoy.resume.service.FindProfileService;
import com.medovoy.resume.util.SecurityUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.data.web.SortDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;


@Controller
public class PublicDataController {

    @Autowired
    FindProfileService findProfileService;


    @RequestMapping(value = "/{uid}", method = RequestMethod.GET)
    public String getProfile(@PathVariable("uid") String uid, Model model) {
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

    @RequestMapping(value = "/welcome", method = RequestMethod.GET)
    public String getWelcome(Model model) {
        Page<Profile> profiles = findProfileService.findAll(new PageRequest(0, Constants.MAX_PROFILES_PER_PAGE, new Sort("id")));
        model.addAttribute("profiles", profiles.getContent());
        model.addAttribute("page", profiles);
        return "welcome";
    }



    @RequestMapping(value = "/fragment/more", method = RequestMethod.GET)
    public String moreProfiles(Model model, @PageableDefault(size = Constants.MAX_PROFILES_PER_PAGE)
            Pageable pageable) {
        Page<Profile> profiles = findProfileService.findAll(pageable);
        model.addAttribute("profiles", profiles.getContent());
        return "fragment/profile-items";
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String getSearch(@RequestParam(value = "query", required = false) String query, Model model,
                            @PageableDefault(size = Constants.MAX_PROFILES_PER_PAGE)
                                    Pageable pageable) throws UnsupportedEncodingException {
        if (StringUtils.isEmpty(query)) {
            return "redirect:/welcome";
        } else {
            Page<Profile> profiles = findProfileService.findBySearchQuery(query, pageable);
            model.addAttribute("profiles", profiles.getContent());
            model.addAttribute("page", profiles);
            model.addAttribute("query", URLDecoder.decode(query, "UTF-8"));
            return "search-results";

        }


    }

    @RequestMapping(value = "/sign-in")
    public String signIn() {
        CurrentProfile currentProfile = SecurityUtil.getCurrentProfile();
        if (currentProfile != null) {
            return "redirect:/" + currentProfile.getUsername();
        } else {
            return "sign-in";
        }
    }


    @RequestMapping(value = "/sign-in-failed")
    public String signInFailed(HttpSession session) {
        if (session.getAttribute("SPRING_SECURITY_LAST_EXCEPTION") == null) {
            return "redirect:/sign-in";
        }
        return "sign-in";
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
//        Profile profile = findProfileService.findByRestoreToken(token);
//        SecurityUtil.authenticate(profile);
        return "redirect:/edit/password";
    }



    @RequestMapping(value = "/error", method = RequestMethod.GET)
    public String getError() {
        return "error";
    }
}

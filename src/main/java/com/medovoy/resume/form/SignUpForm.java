package com.medovoy.resume.form;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.medovoy.resume.constrain.annotation.EnglishLanguage;
import com.medovoy.resume.constrain.annotation.FieldMatch;


//@FieldMatch(first = "password", second = "confirmPassword", message = "The password fields must match")
public class SignUpForm extends PasswordForm {

    @NotNull
    @Size(max = 50)
    @EnglishLanguage(withNumbers = false, withSpeechSymbols = false)
    private String firstName;

    @NotNull
    @Size(max = 50)
    @EnglishLanguage(withNumbers = false, withSpeechSymbols = false)
    private String lastName;

    private String password;

    private String confirmPassword;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
}

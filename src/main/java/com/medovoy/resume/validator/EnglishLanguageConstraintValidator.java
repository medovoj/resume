package com.medovoy.resume.validator;

import com.medovoy.resume.constrain.annotation.EnglishLanguage;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class EnglishLanguageConstraintValidator implements ConstraintValidator<EnglishLanguage, String> {

    private boolean withNumbers;
    private boolean withPunctuations;
    private boolean withSpeechSymbols;

    @Override
    public void initialize(EnglishLanguage constraintAnnotation) {
        this.withNumbers      = constraintAnnotation.withNumbers();
        this.withPunctuations = constraintAnnotation.withPunctuations();
        this.withSpeechSymbols = constraintAnnotation.withSpeechSymbols();
    }

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        if(value == null) {
            return true;
        }
        String validationTemplate = getValidationTemplate();
        for(int i=0;i<value.length();i++){
            char ch = value.charAt(i);
            if(validationTemplate.indexOf(ch) == -1) {
                return false;
            }
        }
        return true;
    }

    private static final String SPEECH_SYMBOLS = "~#$%^&*-+=_\\|/@`!'\";:><,.?{}";
    private static final String PUNCTUATIONS = ".,?!-:()'\"[]{}; \t\n";
    private static final String NUMBERS = "0123456789";
    private static final String LETTERS = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";

    private String getValidationTemplate(){
        StringBuilder template = new StringBuilder(LETTERS);
        if(withNumbers) {
            template.append(NUMBERS);
        }
        if(withPunctuations) {
            template.append(PUNCTUATIONS);
        }
        if(withSpeechSymbols) {
            template.append(SPEECH_SYMBOLS);
        }
        return template.toString();
    }
}
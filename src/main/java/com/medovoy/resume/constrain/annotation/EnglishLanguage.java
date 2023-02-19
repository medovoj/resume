package com.medovoy.resume.constrain.annotation;

import com.medovoy.resume.validator.EnglishLanguageConstraintValidator;

import static java.lang.annotation.ElementType.ANNOTATION_TYPE;
import static java.lang.annotation.ElementType.CONSTRUCTOR;
import static java.lang.annotation.ElementType.FIELD;
import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.ElementType.PARAMETER;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;


@Target({ METHOD, FIELD, ANNOTATION_TYPE, CONSTRUCTOR, PARAMETER })
@Retention(RUNTIME)
@Documented
@Constraint(validatedBy = { EnglishLanguageConstraintValidator.class })
public @interface EnglishLanguage {

	String message() default "EnglishLanguage";
	boolean withNumbers() default true;
	
	boolean withPunctuations() default true;
	
	boolean withSpeechSymbols() default true;
	
	Class<? extends Payload>[] payload() default { };
	
	Class<?>[] groups() default { };
}

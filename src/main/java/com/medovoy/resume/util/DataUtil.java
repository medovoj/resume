package com.medovoy.resume.util;

import java.util.Random;

import com.medovoy.resume.form.SignUpForm;
import org.apache.commons.lang.WordUtils;



public class DataUtil {

	public static String normalizeName(String name) {
		return name.trim().toLowerCase();
	}

	public static String capitalizeName(String name) {
		return WordUtils.capitalize(normalizeName(name));
	}

	public static String generateProfileUid(SignUpForm profile) {
		return normalizeName(profile.getFirstName()) + UID_DELIMITER + normalizeName(profile.getLastName());
	}

	public static String regenerateUidWithRandomSuffix(String baseUid, String alphabet, int letterCount) {
		return baseUid + UID_DELIMITER + generateRandomSuffix(alphabet, letterCount);
	}

	public static String generateRandomSuffix(String alphabet, int letterCount) {
		Random r = new Random();
		StringBuilder uid = new StringBuilder();
		for (int i = 0; i < letterCount; i++) {
			uid.append(alphabet.charAt(r.nextInt(alphabet.length())));
		}
		return uid.toString();
	}

	private static final String UID_DELIMITER = "-";

	public static String generateRandomString(String alphabet, int letterCount) {
		Random r = new Random();
		StringBuilder uid = new StringBuilder();
		for (int i = 0; i < letterCount; i++) {
			uid.append(alphabet.charAt(r.nextInt(alphabet.length())));
		}
		return uid.toString();
	}
}

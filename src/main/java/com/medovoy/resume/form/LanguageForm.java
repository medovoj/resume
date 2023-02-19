package com.medovoy.resume.form;

import com.medovoy.resume.entity.Language;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;



public class LanguageForm {
	@Valid
	private List<Language> items = new ArrayList<>();
	
	public LanguageForm() {
		super();
	}

	public LanguageForm(List<Language> items) {
		super();
		this.items = items;
	}

	public List<Language> getItems() {
		return items;
	}

	public void setItems(List<Language> items) {
		this.items = items;
	}
}

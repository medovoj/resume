package com.medovoy.resume.form;

import com.medovoy.resume.entity.Practice;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;



public class PracticeForm {
	@Valid
	private List<Practice> items = new ArrayList<>();
	
	public PracticeForm() {
		super();
	}

	public PracticeForm(List<Practice> items) {
		super();
		this.items = items;
	}

	public List<Practice> getItems() {
		return items;
	}

	public void setItems(List<Practice> items) {
		this.items = items;
	}
}

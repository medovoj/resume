package com.medovoy.resume.form;

import com.medovoy.resume.entity.Profile;

import javax.validation.Valid;
import java.io.Serializable;


public class InfoForm implements Serializable {

	@Valid
	private String info;

	public InfoForm() {
		super();
	}

	public InfoForm(String info) {
		super();
		this.info = info;
	}
	
	public InfoForm(Profile profile) {
		super();
		this.info = profile.getInfo();
	}

	public String getInfo() {
		return info != null ? info.trim() : null;
	}

	public void setInfo(String info) {
		this.info = info;
	}
}

package com.medovoy.resume.service;


import com.medovoy.resume.entity.Profile;

public interface NotificationManagerService {

	void sendRestoreAccessLink(Profile profile, String restoreLink);

	void sendPasswordChanged(Profile profile);
}

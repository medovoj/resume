package com.medovoy.resume.service;


import com.medovoy.resume.entity.Profile;
import com.medovoy.resume.model.NotificationMessage;

public interface NotificationSenderService {

	void sendNotification(NotificationMessage message);

	String getDestinationAddress(Profile profile);
}

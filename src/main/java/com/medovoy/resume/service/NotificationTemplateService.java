package com.medovoy.resume.service;


import com.medovoy.resume.model.NotificationMessage;

public interface NotificationTemplateService {

	NotificationMessage createNotificationMessage (String templateName, Object model);
}

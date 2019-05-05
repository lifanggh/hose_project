package com.zy.activity.service;

import java.util.List;


import com.zy.activity.pojo.Activity;

public interface ActivityService {

	List<Activity> getActivityAll();

	void addGetIdAll(Activity activity);

	void delByIdActivity(Integer acid);

	Activity getActivityId(Integer acid);

	void upDaActivity(Activity activity);

}

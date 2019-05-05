package com.zy.activity.dao;

import java.util.List;

import com.zy.activity.pojo.Activity;

public interface ActivityDao {

	List<Activity> getActivityAll();

	void addgetIdAll(Activity activity);

	void delActivityById(Integer acid);

	Activity getActivityId(Integer acid);

	void upDaActivity(Activity activity);

}

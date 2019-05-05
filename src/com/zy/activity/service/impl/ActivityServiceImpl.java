package com.zy.activity.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zy.activity.dao.ActivityDao;
import com.zy.activity.pojo.Activity;
import com.zy.activity.service.ActivityService;

@Service
public class ActivityServiceImpl implements ActivityService {
	
	@Autowired
	private ActivityDao dao;

	@Override
	public List<Activity> getActivityAll() {
		
		return dao.getActivityAll();
	}

	@Override
	public void addGetIdAll(Activity activity) {
		dao.addgetIdAll(activity);
		
	}

	@Override
	public void delByIdActivity(Integer acid) {
		
		dao.delActivityById(acid);
	}

	@Override
	public Activity getActivityId(Integer acid) {
		Activity activity=dao.getActivityId(acid);
		return activity;
	}

	@Override
	public void upDaActivity(Activity activity) {
        //dao.upDaActivity(activity);	
        dao.upDaActivity(activity);
	}

}

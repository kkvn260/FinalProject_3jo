package com.kosta.o2service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosta.o2dao.O2DAO;

@Service
public class O2ServiceImple implements O2Service {
	@Resource(name = "o2DAO")
	private O2DAO dao;
	
	
}

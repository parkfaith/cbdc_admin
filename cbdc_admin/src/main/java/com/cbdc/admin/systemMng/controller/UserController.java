package com.cbdc.admin.systemMng.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cbdc.admin.systemMng.model.UserModel;
import com.cbdc.admin.systemMng.service.UserService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class UserController {
	private final UserService userService;
	
	@GetMapping("/test")
	public List<UserModel> getCodeList(){
		return userService.getCodeList();
	}
}

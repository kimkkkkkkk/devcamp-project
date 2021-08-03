package com.koreait.meeting.controller.profile;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.koreait.meeting.domain.Admin;
import com.koreait.meeting.domain.ProFile;
import com.koreait.meeting.model.common.file.FileManager;
import com.koreait.meeting.model.service.profile.ProFileService;


//등록, 수정, 삭제, 이미지 파일 등록
@Controller
public class ProFileController {

	private static final Logger logger = LoggerFactory.getLogger(ProFileController.class);
	@Autowired
	private ProFileService proFileService;
	@Autowired
	private  FileManager fileManager;
	
//	//?? 모든 프로필 가져오기 ??
//	@RequestMapping(value="/regist", method=RequestMethod.GET)
//	public String getList(Model model, HttpServletRequest request){
//		//3단계 : 일시키기
//		List profileList = proFileService.selectAll();
//		
//		//4단계 : 결과저장
//		model.addAttribute("profileList",profileList);
//		
//		return "admin/profile/regist";
//	}
//	
	//프로필 등록폼 요청처리 
	@GetMapping("/registform")
	public String registForm(Model model, HttpServletRequest request) {
		//3단계: 최상위 카테고리 가져오기 
		List profileList = proFileService.selectAll();
		
		//4단계:결과저장 
		model.addAttribute("profileList", profileList);
		
		return "admin/profile/regist";
	}
	
	//프로필 등록 요청(파일업로드 포함)
	@PostMapping("/regist")
	public String regist(ProFile proFile, HttpServletRequest request) {
		
		MultipartFile photo=proFile.getPhoto();
		ServletContext context = request.getServletContext();
		long time=System.currentTimeMillis();
		
		String imgfile=time+"."+fileManager.getExt(photo.getOriginalFilename());
		
		fileManager.saveFile(context, imgfile , photo);
		HttpSession session = request.getSession();
		Admin admin = (Admin)session.getAttribute("admin");
		//System.out.println("프로플 등록 직전의 sign_id"+admin.getSign_id());
		
		proFile.setSign_id(admin.getSign_id());
		proFile.setFilename(imgfile); 
		proFileService.regist(proFile);
		
		//추후 프로필을 사요하기 위해 세션에 담아놓아야 한다  
		session.setAttribute("proFile", proFile); //profile_id 채워져 있다... selectkey 에 의해 
		//System.out.println("프로플 등록 후  select key 's profile_id  = "+admin.getSign_id());
		
		//return "admin/main/index"; // 프로필 목록페이지를 재요청
		return "admin/profile/detail";
	}

//	//프로필 상세보기 요청 , 상세보기 만들어야하나유......ㅜ
//	@GetMapping("/profile/detail")
//	public String getDetail(int profile_id, Model model, HttpServletRequest request) {
//		
//		//3단계: 일시키기
//		ProFile proFile= proFileService.select(profile_id);
//		List profileList=proFileService.selectAll();
//		
//		//4단계: 결과 저장
//		model.addAttribute("ProFile", proFile);
//		model.addAttribute("profileList", profileList);
//		
//		return "admin/main/index";
//	}
	
	//프로필 수정 처리하기
	@PostMapping("/edit")
	public String update(ProFile proFile, HttpServletRequest request) {
		
		
		MultipartFile photo=proFile.getPhoto();
		ServletContext context = request.getServletContext();
		long time=System.currentTimeMillis();
		
		String imgfile=time+"."+fileManager.getExt(photo.getOriginalFilename());
		
		fileManager.saveFile(context, imgfile , photo);
		HttpSession session = request.getSession();
		Admin admin = (Admin)session.getAttribute("admin");
		//System.out.println("프로플 등록 직전의 sign_id"+admin.getSign_id());
		
		proFile.setSign_id(admin.getSign_id());
		proFile.setFilename(imgfile); 
		proFileService.update(proFile);
		
		//추후 프로필을 사요하기 위해 세션에 담아놓아야 한다  
		session.setAttribute("proFile", proFile); //profile_id 채워져 있다... selectkey 에 의해 
		//System.out.println("프로플 등록 후  select key 's profile_id  = "+admin.getSign_id());
		
		//return "admin/main/index"; // 프로필 목록페이지를 재요청
		
		return "redirect:/profile/detail"; // 다시 등록폼으로
	}

	//관리자 메인 페이지 요청 
	@GetMapping("/gallery")
	public String getGallery(HttpServletRequest request) {
		return "admin/profile/people";
	}



}

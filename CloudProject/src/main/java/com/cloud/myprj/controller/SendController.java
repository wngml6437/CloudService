package com.cloud.myprj.controller;

import java.nio.charset.Charset;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cloud.myprj.member.JoinVO;
import com.cloud.myprj.member.MemberVO;
import com.cloud.myprj.member.SendVO;
import com.cloud.myprj.service.IFileSendService;
import com.cloud.myprj.service.IFileUploadService;
import com.cloud.myprj.service.IUserService;

@Controller
public class SendController {

	static final Logger logger = LoggerFactory.getLogger(SendController.class);

	@Autowired
	IFileSendService fileSendService;

	@Autowired
	IFileUploadService fileUploadService;
	
	@Autowired
	IUserService userService;

	@RequestMapping(value = "/send")
	public String sendHome(HttpServletRequest req) {
		if(userService.logincheck(req) == 1) {
			return "send/sendhome";
		}
		else return "redirect:/home";
	}

	@RequestMapping(value = "/send/write")
	public String send(Model model, HttpServletRequest req, MemberVO memberVO) {
		if(userService.logincheck(req) == 1) {
			HttpSession session = req.getSession();
	
			memberVO = (MemberVO) session.getAttribute("memberVO");
			model.addAttribute("memberVO", memberVO);
			model.addAttribute("userList", fileSendService.userList());
			model.addAttribute("fileList", fileUploadService.getPersonalFileList(memberVO.getMemberNum()));
	
			return "send/write";
		}
		else return "redirect:/home";
	}

	@RequestMapping(value = "/send/write", method = RequestMethod.POST)
	public String write(SendVO sendVO /* http세션으로 membernum받기 */) {

		fileSendService.uploadSend(sendVO);

		return "send/sendhome";
	}

	@RequestMapping(value = "/send/list", method = RequestMethod.GET)
	public String list(Model model, HttpServletRequest req, MemberVO memberVO) {
		if(userService.logincheck(req) == 1) {
			HttpSession session = req.getSession();
			memberVO = (MemberVO) session.getAttribute("memberVO");
			model.addAttribute("memberVO", memberVO);
	
			model.addAttribute("recivedMail", fileSendService.receivedMail(memberVO.getMemberNum()));
			
			return "send/list";
		}
		else return "redirect:/home";
	}

	@RequestMapping(value = "/send/view/{sendNum}", method = RequestMethod.GET)
	public String view(@PathVariable int sendNum, Model model, HttpServletRequest req) {
		if(userService.logincheck(req) == 1) {
			model.addAttribute("viewMail", fileSendService.viewMail(sendNum));
			fileSendService.readCheck(sendNum);
	
			return "send/view";
		}
		else return "redirect:/home";
	}

	@RequestMapping(value = "/send/view/download/{sendNum}")
	public ResponseEntity<byte[]> viewMailDownload(@PathVariable int sendNum, HttpServletRequest req) {
		if(userService.logincheck(req) == 1) {
			JoinVO vo = fileSendService.viewMail(sendNum);
			final HttpHeaders headers = new HttpHeaders();
			if (vo != null) {
				headers.setContentDispositionFormData("attachment", vo.getFileName(), Charset.forName("UTF-8"));
	
				return new ResponseEntity<byte[]>(vo.getFileContent(), headers, HttpStatus.OK);
			} else {
				return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);
			}
		}
		else return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);
	}
	
	@RequestMapping(value="/send/delete/{sendNum}")
	public String mailDelete(@PathVariable int sendNum, HttpServletRequest req) {
		if(userService.logincheck(req) == 1) {
			fileSendService.delete(sendNum);
			return "redirect:/send/list";
		}
		else return "redirect:/home";
	}

}

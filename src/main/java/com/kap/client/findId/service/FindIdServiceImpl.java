package com.kap.client.findId.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kap.admin.member.vo.MemberVO;
import com.kap.client.findId.dao.FindIdDao;

import lombok.Setter;


@Service
public class FindIdServiceImpl implements FindIdService {
	
	@Setter(onMethod_= @Autowired)
	private FindIdDao findIdDao;
	
	@Override
	public String findId(MemberVO mvo) {
		return findIdDao.findId(mvo);
	}
	
	@Override
	public void findPw(HttpServletResponse response, MemberVO mvo) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		
		MemberVO cvo = findIdDao.readClient(mvo.getUser_id());
		PrintWriter out = response.getWriter();
		
		// 아이디 없으면
		if(findIdDao.idCheck(mvo.getUser_id()) == null) {
			out.print("등록되지 않은 아이디입니다.");
			out.close();
		}
		// 이메일 없으면
		else if(!mvo.getUser_email().equals(cvo.getUser_email())) {
			out.print("등록되지 않은 이메일입니다.");
			out.close();
		}else {
			// 임시 비밀번호 생성
			int index = 0;
			char[] charSet = new char[] {
	                '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
	                'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
	                'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
	                '!', '@', '#', '$', '%', '^', '&' };
			StringBuffer pw = new StringBuffer();
			for (int i=0; i<12; i++) {
				index = (int)(charSet.length * Math.random());
				pw.append(charSet[index]);
			}
			String user_pwd = pw.toString();
			
			// 비밀번호 변경 
			mvo.setUser_pwd(user_pwd);
			findIdDao.updatePw(mvo);
			
			// 비밀번호 변경 메일 발송
			sendEmail(mvo, "findpw");

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}

	@Override
	public void sendEmail(MemberVO mvo, String div) {
		// Mail Server
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com"; 
		String hostSMTPid = ""; //각자 실제 메일로
		String hostSMTPpwd = ""; //각자 실제 메일 비밀번호로

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = ""; //각자 실제 메일로
		String fromName = "(주)전통주의";
		String subject = "";
		String msg = "";

		if(div.equals("findpw")) {
			subject = "(주)전통주의 임시 비밀번호입니다. .";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += mvo.getUser_id() + "님의 임시 비밀번호입니다. 비밀번호를 변경하여 사용해주세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += mvo.getUser_pwd() + "</p></div>";
		}

		// 받는사람 E-Mail
		String mail = mvo.getUser_email();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587); //465

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일 발송 실패 : " + e);
		}
	}
	
}
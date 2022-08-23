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
		
		// ���̵� ������
		if(findIdDao.idCheck(mvo.getUser_id()) == null) {
			out.print("��ϵ��� ���� ���̵��Դϴ�.");
			out.close();
		}
		// �̸��� ������
		else if(!mvo.getUser_email().equals(cvo.getUser_email())) {
			out.print("��ϵ��� ���� �̸����Դϴ�.");
			out.close();
		}else {
			// �ӽ� ��й�ȣ ����
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
			
			// ��й�ȣ ���� 
			mvo.setUser_pwd(user_pwd);
			findIdDao.updatePw(mvo);
			
			// ��й�ȣ ���� ���� �߼�
			sendEmail(mvo, "findpw");

			out.print("�̸��Ϸ� �ӽ� ��й�ȣ�� �߼��Ͽ����ϴ�.");
			out.close();
		}
	}

	@Override
	public void sendEmail(MemberVO mvo, String div) {
		// Mail Server
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com"; 
		String hostSMTPid = ""; //���� ���� ���Ϸ�
		String hostSMTPpwd = ""; //���� ���� ���� ��й�ȣ��

		// ������ ��� EMail, ����, ����
		String fromEmail = ""; //���� ���� ���Ϸ�
		String fromName = "(��)��������";
		String subject = "";
		String msg = "";

		if(div.equals("findpw")) {
			subject = "(��)�������� �ӽ� ��й�ȣ�Դϴ�. .";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += mvo.getUser_id() + "���� �ӽ� ��й�ȣ�Դϴ�. ��й�ȣ�� �����Ͽ� ������ּ���.</h3>";
			msg += "<p>�ӽ� ��й�ȣ : ";
			msg += mvo.getUser_pwd() + "</p></div>";
		}

		// �޴»�� E-Mail
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
			System.out.println("���� �߼� ���� : " + e);
		}
	}
	
}
package com.qst.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qst.bean.Student;
import com.qst.service.StudentService;
import com.qst.service.StudentServiceimp;


/**
 * Servlet implementation class addStudent
 */
@WebServlet("/AddStudent")
public class AddStudent extends HttpServlet {
	private static final long serialVersionUID = 5804433309240831094L;

	public AddStudent() {
		super();
	}

	public void destroy() {
		super.destroy(); 
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		HttpServletRequest req = (HttpServletRequest) request; 
		req.setCharacterEncoding("utf-8");
		String name = request.getParameter("stuName");
		String sex = request.getParameter("sex");
		String age = request.getParameter("stuAge"); 

		System.out.println(name );
		
		Student stu = new Student();
		stu.setName(name);
		stu.setAge(age);
		stu.setSex(sex);
		
		StudentService studentService = new StudentServiceimp();
		
		if(studentService.findStudent(stu)){//如果学生已经存在就不添加
			response.sendRedirect("html/commodity.jsp");
			
		}else{//如果学生不存在就添加
			
			String opr = request.getParameter("opr");//根据传的opr参数决定是添加学生还是修改学生
			int n = 0;
			if(opr.equals("addStu")){
				n = studentService.addStudent(stu);
			}else if(opr.equals("modifyStu")){
				int id = Integer.parseInt(request.getParameter("stuId"));
				stu.setId(id);
				n = studentService.modifyStudent(stu);
			}
			
			
			if(n>0){
				response.sendRedirect("html/commodity.jsp");
			}else{
				response.sendRedirect("html/commodity.jsp");
			}
			
		}
		
		

	}

	public void init() throws ServletException {
	}

}

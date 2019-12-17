
<%@ page import="java.sql.Date"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.changer.hk/jquery/1.11.2/jquery.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
        *{
            margin: 0;
            padding: 0;
        }
        body{
            background-color: #fff0f0;
        }
        .head{
            margin: 1em;
            text-align: center;
            color: red;
            font-size: 20px;
            font-family: 微软雅黑,sans-serif;
        }
        .main{
            width: 400px;
            height: 150px;
            margin: 4em auto 4em auto;
            padding: 5em;
            background-color: #ffffff;
            text-align: center;
            border: 2px solid #ffffff;
            border-radius: 20px;
        }
        .main a{
            display: block;
            width: 6em;
            height: 1.5em;
            color: #999;
            margin: 4px auto 4px auto;
            text-decoration: none;
            border: 1px solid red;
            border-radius: 5px;
        }
        .main a:hover{
            background-color: brown;
            color: white;
        }
        .main table,.main table td{
            border: 1px solid gray;
            border-collapse: collapse;
        }
        .main table thead{
            background-color: #ffeeee;
        }
        .main table td{
            width: 100px;
            height: 50px;
        }
    </style>

</head>
<body>
	<%
	
	String getIDString = request.getParameter("id");
	String getPWString = request.getParameter("pw");
	String loginID  =  new String(getIDString.getBytes("ISO-8859-1"),"utf-8");
	String loginPw  =  new String(getPWString.getBytes("ISO-8859-1"),"utf-8");
	String name = null;
	int age = 1;
	String serverKind = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url = "jdbc:mysql://123.56.5.186:3306/yahospital?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
		System.out.print("2\n");
		String username = "root";
		String password = "3?HSJdoJ1C#h";
		Connection conn = DriverManager.getConnection(url, username, password);
		System.out.print("13\n");
		
		if(conn != null){
			//out.print("数据库连接成功！\n");
			String sersql = "SELECT id FROM idtext WHERE id=? AND pw=?";
			//String sql = "insert into patientorder (id,name,age,sex,date,severKind) values('5546','煌健','18','男','1','他要去补牙然后洗牙')";
			stmt = conn.prepareStatement(sersql);
			stmt.setString(1, loginID);
			stmt.setString(2, loginPw);
			stmt.executeQuery();
			rs = stmt.executeQuery();
			
			boolean isK = false;
			if(rs.next()){
				isK = true;
			}else{
				isK = false;
			}
			
			if(isK){
				pageContext.forward("main.html");
				
			}
			else{
				pageContext.forward("login.html");

			}
		}
		
	}catch (Exception e){
		e.printStackTrace();
		out.print("数据库连接异常！");
	}
	%>
	

</body>
</html>
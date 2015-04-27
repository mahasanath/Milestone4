package servlet;

import java.io.IOException;

import java.util.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(
        name = "MyServlet", 
        urlPatterns = {"/hello"}
    )
public class HelloServlet extends HttpServlet {
    List<String> serverList = null;
    public static int count = 1;
    public HelloServlet(){
        serverList = new ArrayList<String>();
        serverList.add("http://54.148.105.208:54321");
        serverList.add("http://54.201.118.4:54321");
    }
      //  serverList.add("");
      //  int index = (int)(Math.random()*serverList.size());
   // String toRemove = serverList.get(index);
     //   serverList.remove(index);
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
            if(count % 10 == 0 || serverList.size() == 1){
            resp.sendRedirect(serverList.get(0));
            count++;	    
            } else {
	    resp.sendRedirect(serverList.get(count%(serverList.size()-1)+1));
            count++;	
	    }
	   }    
}

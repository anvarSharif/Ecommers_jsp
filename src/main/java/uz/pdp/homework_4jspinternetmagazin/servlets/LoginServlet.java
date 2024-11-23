package uz.pdp.homework_4jspinternetmagazin.servlets;

import uz.pdp.homework_4jspinternetmagazin.DB;
import uz.pdp.homework_4jspinternetmagazin.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cookie cookie=new Cookie("token","sirlisoz");
        resp.addCookie(cookie);
        String phoneInp = req.getParameter("phone_inp");
        if (phoneInp != null) {
            String passwordInp = req.getParameter("password_inp");
            Optional<User> optionalUser = DB.users.stream()
                    .filter(item -> item.getPassword().equals(passwordInp)
                            && item.getPhone().equals(phoneInp)).findFirst();
            if (optionalUser.isPresent()) {
                User currentUser = optionalUser.get();
                Cookie cookie1=new Cookie("userId",currentUser.getId().toString());
                resp.addCookie(cookie1);
                resp.sendRedirect("/product.jsp");
                return;
            }
        }

        resp.sendRedirect("/login.jsp");

    }
}

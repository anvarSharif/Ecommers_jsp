package uz.pdp.homework_4jspinternetmagazin.servlets.auth;

import uz.pdp.homework_4jspinternetmagazin.DB;
import uz.pdp.homework_4jspinternetmagazin.entity.Basket;
import uz.pdp.homework_4jspinternetmagazin.entity.Role;
import uz.pdp.homework_4jspinternetmagazin.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Objects;
import java.util.Optional;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String phoneInp = req.getParameter("phone_inp");
        if (phoneInp != null) {
            String passwordInp = req.getParameter("password_inp");
            Optional<User> optionalUser = DB.users.stream()
                    .filter(item -> item.getPassword().equals(passwordInp)
                            && item.getPhone().equals(phoneInp)).findFirst();
            if (optionalUser.isPresent()) {
                User currentUser = optionalUser.get();
                HttpSession session = req.getSession();
                session.setAttribute("user",currentUser);
                Basket basket = (Basket) session.getAttribute("basket");

                if (currentUser.getRole().equals(Role.ADMIN)){
                    resp.sendRedirect("/admin/category.jsp");
                    return;
                }

                if (basket==null||basket.getMap().isEmpty()){
                    resp.sendRedirect("/home.jsp");
                    return;
                }
                resp.sendRedirect("/basket.jsp");
                return;
            }
        }
        resp.sendRedirect("/auth/login.jsp");
    }
}

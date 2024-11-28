package uz.pdp.homework_4jspinternetmagazin.servlets.auth;

import uz.pdp.homework_4jspinternetmagazin.DB;
import uz.pdp.homework_4jspinternetmagazin.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Optional;

@WebServlet("/register")
@MultipartConfig
public class RegisterServlet extends HttpServlet {
    static String absolutPath = "C:/java/PDP java/7-modul-jsp/homework_4-jsp-internet-magazin/files/";
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String phoneInp = req.getParameter("phone_inp");
        String passwordInp = req.getParameter("password_inp");
        String passwordRepeatInp = req.getParameter("password_repeat_inp");
        if (!passwordInp.equals(passwordRepeatInp)) {
            resp.sendRedirect("/auth/register.jsp");
            return;
        }
        Part part = req.getPart("userPhoto");
        Path path = Files.write(
                Path.of(absolutPath + part.getSubmittedFileName() + ".jpg")
                , part.getInputStream().readAllBytes());
        String photoUrl = path.toString();
        DB.users.add(new User(phoneInp,passwordInp,photoUrl));
        resp.sendRedirect("/auth/login.jsp");
    }


}

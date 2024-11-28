package uz.pdp.homework_4jspinternetmagazin.servlets;

import uz.pdp.homework_4jspinternetmagazin.DB;
import uz.pdp.homework_4jspinternetmagazin.entity.Product;
import uz.pdp.homework_4jspinternetmagazin.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;

@WebServlet("/user/file/*")
public class UserFileServlet extends HttpServlet {
    static String absolutPath = "C:/java/PDP java/7-modul-jsp/homework_4-jsp-internet-magazin/target/homework_4-jsp-internet-magazin-1.0-SNAPSHOT";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();
        Integer userId = Integer.parseInt(pathInfo.split("/")[1]);
        User user = DB.users.stream().filter(item -> item.getId().equals(userId)).findFirst().get();
        resp.getOutputStream().write(Files.readAllBytes(Path.of(user.getPhotoUrl())));
    }

}














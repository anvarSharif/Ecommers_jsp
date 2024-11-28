package uz.pdp.homework_4jspinternetmagazin.servlets;

import uz.pdp.homework_4jspinternetmagazin.DB;
import uz.pdp.homework_4jspinternetmagazin.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;

@WebServlet("/file/*")
public class FileServlet extends HttpServlet {
    static String absolutPath = "C:/java/PDP java/7-modul-jsp/homework_4-jsp-internet-magazin/target/homework_4-jsp-internet-magazin-1.0-SNAPSHOT";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();
        Integer productId = Integer.parseInt(pathInfo.split("/")[1]);
        Product product = DB.products.stream().filter(item -> item.getId().equals(productId)).findFirst().get();
        resp.getOutputStream().write(Files.readAllBytes(Path.of(product.getPhotoUrl())));




       /* String pathInfo = req.getPathInfo();
        Integer productId = Integer.parseInt(pathInfo.split("/")[1]);
        Product product = DB.products.stream().filter(item -> item.getId().equals(productId)).findFirst().get();
        resp.getOutputStream().write(Files.readAllBytes(Path.of(product.getPhotoUrl())));*/
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Part part = req.getPart("ProductImage");
        Files.write(Path.of(absolutPath + "files/" + part.getSubmittedFileName() + ".jpg"), part.getInputStream().readAllBytes(), StandardOpenOption.CREATE_NEW);
    }
}














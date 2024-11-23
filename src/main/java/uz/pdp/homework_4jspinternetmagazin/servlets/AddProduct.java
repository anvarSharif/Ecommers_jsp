package uz.pdp.homework_4jspinternetmagazin.servlets;

import uz.pdp.homework_4jspinternetmagazin.DB;
import uz.pdp.homework_4jspinternetmagazin.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;

@WebServlet("/product/add")
@MultipartConfig
public class AddProduct extends HttpServlet {
    static String absolutPath = "C:/java/PDP java/7-modul-jsp/homework_4-jsp-internet-magazin/files/";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Part part = req.getPart("productImage");
        Path path = Files.write(
                Path.of(absolutPath + part.getSubmittedFileName() + ".jpg")
                , part.getInputStream().readAllBytes());
        String photoUrl = path.toString();

        String name = req.getParameter("name");
        Integer price = Integer.parseInt(req.getParameter("price"));
        Integer categoryId = Integer.parseInt(req.getParameter("categoryId"));
        Product product=new Product(
                categoryId,price,name,photoUrl
        );
        DB.products.add(product);
        resp.sendRedirect("/product.jsp");
    }
}

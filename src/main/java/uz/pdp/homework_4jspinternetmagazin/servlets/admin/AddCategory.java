package uz.pdp.homework_4jspinternetmagazin.servlets.admin;

import uz.pdp.homework_4jspinternetmagazin.DB;
import uz.pdp.homework_4jspinternetmagazin.entity.Category;
import uz.pdp.homework_4jspinternetmagazin.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

@WebServlet("/category/add")
@MultipartConfig
public class AddCategory extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String categoryId = req.getParameter("categoryId");
        if (!categoryId.equals("null")){
            Category category = DB.categories.stream().filter(item->item.getId().equals(Integer.parseInt(categoryId))).findAny().get();
            category.setName(name);
        }else {
            DB.categories.add(new Category(name));
        }
        resp.sendRedirect("/admin/category.jsp");
    }
}
package uz.pdp.homework_4jspinternetmagazin.servlets.admin;

import uz.pdp.homework_4jspinternetmagazin.DB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/category/delete")
public class DeleteCategoryServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String categoryId = req.getParameter("categoryId");
        DB.categories.removeIf(item->item.getId().equals(Integer.parseInt(categoryId)));
        resp.sendRedirect("/admin/category.jsp");
    }
}

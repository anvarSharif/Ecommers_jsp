package uz.pdp.homework_4jspinternetmagazin.servlets.admin;

import uz.pdp.homework_4jspinternetmagazin.DB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/product/delete")
public class DeleteProductServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productId = req.getParameter("productId");
        DB.products.removeIf(item->item.getId().equals(Integer.parseInt(productId)));
        resp.sendRedirect("/admin/product.jsp");
    }
}

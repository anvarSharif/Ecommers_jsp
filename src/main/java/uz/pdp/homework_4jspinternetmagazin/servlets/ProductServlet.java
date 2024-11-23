package uz.pdp.homework_4jspinternetmagazin.servlets;

import uz.pdp.homework_4jspinternetmagazin.DB;
import uz.pdp.homework_4jspinternetmagazin.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/product")
public class ProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer productId = Integer.parseInt(req.getParameter("productId"));
        Product product = DB.products.stream()
                .filter(item -> item.getId().equals(productId))
                .findFirst().get();

        if (product.isChecked()) {
            product.setChecked(false);
            DB.savatcha.keySet().removeIf(p -> p.getId().equals(product.getId()));
        } else {
            product.setChecked(true);
            DB.savatcha.put(product, 1);
        }
        resp.sendRedirect("/product.jsp");
    }
}

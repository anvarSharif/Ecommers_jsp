package uz.pdp.homework_4jspinternetmagazin.servlets;

import uz.pdp.homework_4jspinternetmagazin.DB;
import uz.pdp.homework_4jspinternetmagazin.entity.Basket;
import uz.pdp.homework_4jspinternetmagazin.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Objects;

@WebServlet("/basket/delete")
public class DeleteFromBasket extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer productId = Integer.parseInt(req.getParameter("productId"));
        String categoryId = req.getParameter("categoryId");

        HttpSession session = req.getSession();
        Basket basket = (Basket) Objects.requireNonNullElse(session.getAttribute("basket"), new Basket());
        Product product = DB.products.stream()
                .filter(item -> item.getId().equals(productId))
                .findFirst().get();
        basket.getMap().remove(product);
        session.setAttribute("basket", basket);

        if (categoryId.equals("non")) {
            resp.sendRedirect("/home.jsp");
        } else {
            resp.sendRedirect("/home.jsp?categoryId=" + categoryId);
        }
    }
}

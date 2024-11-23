package uz.pdp.homework_4jspinternetmagazin.servlets;

import uz.pdp.homework_4jspinternetmagazin.DB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/basket")
public class BasketServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String operator = req.getParameter("operator");
        Integer productId = Integer.parseInt(req.getParameter("productId"));
        if (operator.equals("plus")) {
            DB.savatcha.entrySet().stream().filter(item -> item.getKey().getId().equals(productId))
                    .findFirst().ifPresent(item -> DB.savatcha.put(item.getKey(), item.getValue() + 1));
        } else if (operator.equals("minus")) {
            DB.savatcha.entrySet().stream().filter(item -> item.getKey().getId().equals(productId))
                    .findFirst().ifPresent(item -> {
                        if (item.getValue() == 1) {
                            DB.savatcha.keySet().removeIf(i -> i.getId().equals(productId));
                        } else {
                            DB.savatcha.put(item.getKey(), item.getValue() - 1);
                        }
                    });
        }
        resp.sendRedirect("/basket.jsp");
    }
}


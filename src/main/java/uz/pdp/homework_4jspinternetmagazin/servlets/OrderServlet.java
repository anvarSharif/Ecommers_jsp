package uz.pdp.homework_4jspinternetmagazin.servlets;

import uz.pdp.homework_4jspinternetmagazin.DB;
import uz.pdp.homework_4jspinternetmagazin.Servise;
import uz.pdp.homework_4jspinternetmagazin.entity.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Basket basket = (Basket) session.getAttribute("basket");
        if (basket==null||basket.getMap().isEmpty()){
            resp.sendRedirect("/home.jsp");
            return;
        }
        Map<Product, Integer> savatcha = basket.getMap();

        if (session.getAttribute("user")==null){
            resp.sendRedirect("/auth/login.jsp");
            return;
        }
        List<OrderItem> tempOrderItems = new ArrayList<>();
        User user = (User) session.getAttribute("user");
        Order order = new Order(user.getId());
        DB.orders.add(order);
        savatcha.forEach(
                (key, value) -> {
                    tempOrderItems.add(new OrderItem(
                            order.getId(),
                            key.getId(),
                            value
                    ));
                }
        );
        DB.orderItems.addAll(tempOrderItems);
        savatcha.clear();
        session.setAttribute("basket",basket);
        resp.sendRedirect("/home.jsp");
    }
}

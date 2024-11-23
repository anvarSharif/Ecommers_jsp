package uz.pdp.homework_4jspinternetmagazin.servlets;

import uz.pdp.homework_4jspinternetmagazin.DB;
import uz.pdp.homework_4jspinternetmagazin.Servise;
import uz.pdp.homework_4jspinternetmagazin.entity.Order;
import uz.pdp.homework_4jspinternetmagazin.entity.OrderItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        boolean loggedUser = Servise.isLoggedUser(req);
        if (!loggedUser) {
            resp.sendRedirect("/login.jsp");
            return;
        }
        List<OrderItem> tempOrderItems = new ArrayList<>();
        Cookie cookie = Arrays.stream(req.getCookies()).filter(item -> item.getName().equals("userId")).findFirst().get();
        Order order = new Order(Integer.parseInt(cookie.getValue()));
        DB.orders.add(order);
        DB.savatcha.forEach(
                (key, value) -> {
                    tempOrderItems.add(new OrderItem(
                            order.getId(),
                            key.getId(),
                            value
                    ));
                }
        );
        DB.orderItems.addAll(tempOrderItems);
        DB.savatcha.clear();
        DB.products.forEach(product -> product.setChecked(false));
        resp.sendRedirect("/product.jsp");
    }
}

package uz.pdp.homework_4jspinternetmagazin;

import uz.pdp.homework_4jspinternetmagazin.entity.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DB {
    public static List<Category> categories =new ArrayList<>(List.of(
            new Category(1, "Yegulik"),
            new Category(2, "Ichimlik"),
            new Category(3, "Kiygulik"),
            new Category(4, "Texnika")
    ));
    static String absolutPath = "C:/java/PDP java/7-modul-jsp/homework_4-jsp-internet-magazin/";

    public static List<Product> products = new ArrayList<>(List.of(
            new Product(1, 1, 100, "Non",absolutPath+ "files/non.jpg"),
            new Product(2, 1, 300, "Muzqaymoq", absolutPath+"/files/muzqaymoq.jpg"),

            new Product(3, 2, 100, "Kofe", absolutPath+"files/kofe.jpg"),
            new Product(4, 2, 300, "Sok", absolutPath+"files/sok.jpg"),

            new Product(5, 3, 100, "Shim", absolutPath+"files/shim.jpg"),
            new Product(6, 3, 80, "Kuylak", absolutPath+"files/kuylak.jpg"),

            new Product(7, 4, 300, "Telefon", absolutPath+"files/telefon.jpg"),
            new Product(8, 4, 150, "Televizor", absolutPath+"files/televizor.jpg")
    ));

    public static List<User> users=new ArrayList<>(List.of(
            new User(101, "11", "aa"),
            new User(102, "22", "aa"),
            new User(103, "33", "aa")
    ));
    public static List<Order> orders=new ArrayList<>();
    public static List<OrderItem> orderItems=new ArrayList<>();
    public static User CurrentUser=null;
    public static Map<Product,Integer> savatcha=new HashMap<>();
    /*<div class="card">
                <div class="my-1">
                    <img src="/file/<%=product.getId()%>" alt="rasm topilmadi!" width="50" height="50">
                    <%= product.getName()%>
                </div>
                <form action="/product">
                    <input type="hidden" name="productId" value=<%=product.getId()%>>
                    <input type="hidden" name="categoryId" value=<%=categoryIdStr%>>
                    <%if (product.isChecked()) {%>
                    <button class="btn btn-danger">
                X
                </button>
                    <%} else {%>
                    <button class="btn btn-dark">
                Select
                </button>
                    <%}%>
                </form>
            </div>*/
}

package uz.pdp.homework_4jspinternetmagazin.servlets.admin;

import uz.pdp.homework_4jspinternetmagazin.DB;
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

@WebServlet("/product/update")
@MultipartConfig
public class UpdateProductServlet extends HttpServlet {
    static String absolutPath = "C:/java/PDP java/7-modul-jsp/homework_4-jsp-internet-magazin/files/";
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Part part = req.getPart("productImage");
        String productId = req.getParameter("productId");
        String photoUrl="";
        if (!part.getSubmittedFileName().isEmpty()){
            Path path = Files.write(
                    Path.of(absolutPath + part.getSubmittedFileName() + ".jpg")
                    , part.getInputStream().readAllBytes());
            part.getInputStream().close();
            photoUrl = path.toString();
        }else{
            photoUrl=DB.products.stream().filter(item->item.getId().equals(Integer.parseInt(productId))).findAny().map(Product::getPhotoUrl).get();
        }

        String name = req.getParameter("name");
        Integer price = Integer.parseInt(req.getParameter("price"));
        Integer categoryId = Integer.parseInt(req.getParameter("categoryId"));

        Product product=new Product(
                categoryId,price,name,photoUrl
        );
        if (!productId.equals("null")){
            int id = Integer.parseInt(productId);
            DB.products.removeIf(item->item.getId().equals(id));
            product.setId(id);
        }
        DB.products.add(product);
        resp.sendRedirect("/admin/product.jsp");
    }
}

package uz.pdp.homework_4jspinternetmagazin.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Objects;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {
    private Integer id=idGen;
    private Integer categoryId;
    private Integer price;
    private String name;
    private boolean checked=false;
    private String photoUrl;
    private static Integer idGen=9;

    public Product(Integer id, Integer categoryId, Integer price, String name, String photoUrl) {
        this.id = id;
        this.categoryId = categoryId;
        this.price = price;
        this.name = name;
        this.photoUrl = photoUrl;
    }

    public Product(Integer categoryId, Integer price, String name, String photoUrl) {
        this.categoryId = categoryId;
        this.price = price;
        this.name = name;
        this.photoUrl = photoUrl;
    }
}

package uz.pdp.homework_4jspinternetmagazin.entity;

import lombok.Data;

import java.util.HashMap;
import java.util.Map;
@Data
public class Basket {
    private Map<Product,Integer> map=new HashMap<>();
}
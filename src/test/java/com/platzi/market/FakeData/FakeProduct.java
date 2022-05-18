package com.platzi.market.FakeData;

import com.github.javafaker.Faker;
import com.platzi.market.domain.Category;
import com.platzi.market.domain.Product;

import java.util.ArrayList;
import java.util.List;

public class FakeProduct {

    private Integer productId;
    private String name;
    private Integer categoryId;
    private Double price;
    private Integer stock;
    private Boolean active;
    private Category category;

    public FakeProduct(){
        name = new Faker().name().firstName();
        categoryId = 10;
        price = Double.parseDouble(new Faker().commerce().price(1200.0, 1800.0).replace(",","."));
        stock = new Faker().random().nextInt(100, 200);
        active = true;
        category = new FakeCategory().conId(10).build();
    }

    public FakeProduct conId(Integer productId){
        this.productId = productId;
        return this;
    }

    public List<Product> buildList(){
        List<Product> products = new ArrayList<>();
        for (int i = 1; i <= 5; i++){
            products.add(conId(i).build());
        }
        return products;
    }

    public Product build(){
        Product product = new Product();
        product.setProductId(productId);
        product.setName(name);
        product.setCategoryId(categoryId);
        product.setPrice(price);
        product.setStock(stock);
        product.setActive(active);
        product.setCategory(category);
        return product;
    }
}

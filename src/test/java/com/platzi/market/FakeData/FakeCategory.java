package com.platzi.market.FakeData;

import com.github.javafaker.Faker;
import com.platzi.market.domain.Category;

public class FakeCategory {
    private static Faker faker;
    private Integer categoryId;
    private String category;
    private Boolean active;

    public FakeCategory(){
        category = "dulceria";
        active = true;
    }

    public FakeCategory conId(Integer categoryId){
        this.categoryId = categoryId;
        return this;
    }

    public Category build(){
        Category category1 = new Category();
        category1.setCategoryId(categoryId);
        category1.setCategory(category);
        category1.setActive(active);
        return category1;
    }
}

package com.platzi.market.web.controller;

import com.platzi.market.domain.Product;
import com.platzi.market.domain.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/products")
public class ProductController {

    @Autowired
    private ProductService productService;

    @GetMapping()
    public List<Product> getAll(){
        return this.productService.getAll();
    }

    @GetMapping("/{productId}")
    public Optional<Product> getProduct(@PathVariable Integer productId){
        return this.productService.getProduct(productId);
    }

    @GetMapping("/category/{categoryId}")
    public Optional<List<Product>> getByCategory(@PathVariable Integer categoryId){
        return this.productService.getByCategory(categoryId);
    }

    @PostMapping()
    public Product save(@RequestBody Product product){
        return this.productService.save(product);
    }

    @DeleteMapping("/{productId}")
    public Boolean delete(@PathVariable Integer productId){
        return this.productService.delete(productId);
    }
}

package com.platzi.market.domain.services;

import com.platzi.market.domain.Product;
import com.platzi.market.domain.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProductService {

    @Autowired
    private ProductRepository productRepository;

    public List<Product> getAll(){
        return this.productRepository.getAll();
    }

    public Optional<Product> getProduct(Integer productId){
        return this.productRepository.getProduct(productId);
    }

    public Optional<List<Product>> getByCategory(Integer categoryId){
        return this.productRepository.getByCategory(categoryId);
    }

    public Product save(Product product){
        return this.productRepository.save(product);
    }

    public Boolean delete(Integer productId){
        return getProduct(productId).map(product -> {
            this.productRepository.delete(productId);
            return true;
        }).orElse(false);
    }
}

package com.platzi.market.configuration;

import com.platzi.market.domain.repository.ProductRepository;
import com.platzi.market.domain.services.ProductService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class BeanProductService {

    @Bean
    public ProductService productService(ProductRepository productRepository){
        return new ProductService(productRepository);
    }
}

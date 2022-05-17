package com.platzi.market.domain.services;

import com.platzi.market.FakeData.FakeProduct;
import com.platzi.market.domain.Product;
import com.platzi.market.domain.repository.ProductRepository;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ProductServiceTest {

    @Test
    void deberiaObtenerTodosLosProductos() {
        List<Product> products = new FakeProduct().buildList();
        ProductRepository productRepository = Mockito.mock(ProductRepository.class);
        Mockito.when(productRepository.getAll()).thenReturn(products);
        ProductService productService = new ProductService(productRepository);
        Integer cantidadDatos = productService.getAll().size();
        assertEquals(5, cantidadDatos);
    }

    @Test
    void deberiaObtenerUnProductoATravesDeSuId() {
        Product product = new FakeProduct().conId(1).build();
        ProductRepository productRepository = Mockito.mock(ProductRepository.class);
        Mockito.when(productRepository.getProduct(Mockito.anyInt())).thenReturn(Optional.of(product));
        ProductService productService = new ProductService(productRepository);
        Optional<Product> productReturned = productService.getProduct(1);
        assertTrue(productReturned.isPresent());
        assertEquals(product.getName(), productReturned.orElseThrow().getName());
    }

    @Test
    void deberiaObtenerUnProductoATravesDelIdDeCategoria() {
        List<Product> products = new FakeProduct().buildList();
        ProductRepository productRepository = Mockito.mock(ProductRepository.class);
        Mockito.when(productRepository.getByCategory(Mockito.anyInt())).thenReturn(Optional.of(products));
        ProductService productService = new ProductService(productRepository);
        Optional<List<Product>> listOptional = productService.getByCategory(10);
        assertEquals(5, listOptional.orElseThrow().size());
    }

    @Test
    void deberiaGuardarUnProducto() {
        Product product = new FakeProduct().build();
        ProductRepository productRepository = Mockito.mock(ProductRepository.class);
        Mockito.when(productRepository.save(Mockito.any())).thenReturn(product);
        ProductService productService = new ProductService(productRepository);
        Product saved = productService.save(product);
        assertEquals(product.getPrice(), saved.getPrice());
    }

    @Test
    void deberiaEliminarUnProducto() {
        ProductRepository productRepository = Mockito.mock(ProductRepository.class);
        ProductService productService = new ProductService(productRepository);
        productService.delete(1);
        Mockito.verify(productRepository, Mockito.times(1)).getProduct(1);
    }
}
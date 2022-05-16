package com.platzi.market.persistence.entity;

import com.github.javafaker.Faker;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class ProductoTest {

    private static Faker faker;

    @BeforeEach
    void setUp() {
        faker = new Faker();
    }

    @Test
    @DisplayName("Deberia crear un producto")
    void deberiaCrearUnProducto(){
        Producto producto = new Producto();
        producto.setIdProducto(faker.number().randomDigit());
    }

}
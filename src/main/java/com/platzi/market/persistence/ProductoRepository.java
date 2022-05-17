package com.platzi.market.persistence;

import com.platzi.market.domain.repository.ProductRepository;
import com.platzi.market.persistence.crud.ProductoCrudRepository;
import com.platzi.market.persistence.entity.Producto;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public class ProductoRepository{

    private ProductoCrudRepository productoCrudRepository;

    public List<Producto> getAll(){
        return (List<Producto>) this.productoCrudRepository.findAll();
    }

    public List<Producto> getByCategoria(Integer idCategoria){
        return this.productoCrudRepository.findByIdCategoriaOrderByNombreAsc(idCategoria);
    }

    public Optional<List<Producto>> getEscasos(Integer cantidadStock){
        return this.productoCrudRepository.findByCantidadStockLessThanAndEstado(cantidadStock, true);
    }

    public Optional<Producto> getProducto(Integer idProducto){
        return this.productoCrudRepository.findById(idProducto);
    }

    public Producto save(Producto producto){
        return this.productoCrudRepository.save(producto);
    }

    public void delete(Integer idProducto){
        this.productoCrudRepository.deleteById(idProducto);
    }
}

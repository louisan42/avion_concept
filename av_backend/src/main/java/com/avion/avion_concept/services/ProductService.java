package com.avion.avion_concept.services;

import com.avion.avion_concept.jpa.Product;
import com.avion.avion_concept.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {
    @Autowired
    private ProductRepository productRepository;

    public List<Product> getAllProducts() {
        return this.productRepository.findAll();
    }

    public Product getProductById(int id) {
        return this.productRepository.findById(id).orElse(null);
    }
}

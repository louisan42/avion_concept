package com.avion.avion_concept.repository;

import com.avion.avion_concept.jpa.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepository extends JpaRepository<Product, Integer> {
}

package com.avion.avion_concept.controllers;


import com.avion.avion_concept.jpa.Product;
import com.avion.avion_concept.services.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/product")
public class ProductController {
    final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    ProductService productService;


    @GetMapping("/test")
    String testController () {
        logger.debug("The testController() method was invoked!");
        return "The Avion Concept application is up and running";
    }

    @GetMapping("/all")
    List<Product> productList() {
        logger.debug("The getAllProducts() method was invoked!");
        return this.productService.getAllProducts();
    }
}

package com.avion.avion_concept.jpa;

import jakarta.persistence.*;

@Entity
@Table(name = "\"Cart\"")
public class Cart {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "Cart_id_gen")
    @SequenceGenerator(name = "Cart_id_gen", sequenceName = "Cart_cart_id_seq", allocationSize = 1)
    @Column(name = "cart_id", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "customer_id", nullable = false)
    private Customer customer;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "sku_id", nullable = false)
    private ProductSkus sku;

    @Column(name = "quantity", nullable = false)
    private Integer quantity;

    public Integer getId () {
        return id;
    }

    public void setId (Integer id) {
        this.id = id;
    }

    public Customer getCustomer () {
        return customer;
    }

    public void setCustomer (Customer customer) {
        this.customer = customer;
    }

    public ProductSkus getSku () {
        return sku;
    }

    public void setSku (ProductSkus sku) {
        this.sku = sku;
    }

    public Integer getQuantity () {
        return quantity;
    }

    public void setQuantity (Integer quantity) {
        this.quantity = quantity;
    }

}
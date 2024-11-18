package com.avion.avion_concept.jpa;

import jakarta.persistence.*;

import java.math.BigDecimal;

@Entity
@Table(name = "\"OrderItems\"")
public class OrderItem {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "OrderItems_id_gen")
    @SequenceGenerator(name = "OrderItems_id_gen", sequenceName = "OrderItems_order_item_id_seq", allocationSize = 1)
    @Column(name = "order_item_id", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "order_id", nullable = false)
    private Order order;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "sku_id", nullable = false)
    private ProductSkus sku;

    @Column(name = "quantity", nullable = false)
    private Integer quantity;

    @Column(name = "price", nullable = false, precision = 10, scale = 2)
    private BigDecimal price;

    public Integer getId () {
        return id;
    }

    public void setId (Integer id) {
        this.id = id;
    }

    public Order getOrder () {
        return order;
    }

    public void setOrder (Order order) {
        this.order = order;
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

    public BigDecimal getPrice () {
        return price;
    }

    public void setPrice (BigDecimal price) {
        this.price = price;
    }

}
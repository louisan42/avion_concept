package com.avion.avion_concept.jpa;

import jakarta.persistence.*;
import org.hibernate.annotations.ColumnDefault;

import java.math.BigDecimal;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.UUID;

@Entity
@Table(name = "\"Product_SKUs\"")
public class ProductSkus {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "Product_SKUs_id_gen")
    @SequenceGenerator(name = "Product_SKUs_id_gen", sequenceName = "Product_SKUs_sku_id_seq", allocationSize = 1)
    @Column(name = "sku_id", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "product_id", nullable = false)
    private com.avion.avion_concept.jpa.Product product;

    @ColumnDefault("gen_random_uuid()")
    @Column(name = "sku", nullable = false)
    private UUID sku;

    @Column(name = "price", nullable = false, precision = 10, scale = 2)
    private BigDecimal price;

    @ColumnDefault("0")
    @Column(name = "stock_level")
    private Integer stockLevel;

    @Column(name = "material")
    private String material;

    @Column(name = "dimensions")
    private String dimensions;

    @Column(name = "weight", precision = 10, scale = 2)
    private BigDecimal weight;

    @Column(name = "color", length = 50)
    private String color;

    @Column(name = "finish", length = 50)
    private String finish;

    @OneToMany(mappedBy = "sku")
    private Set<Cart> carts = new LinkedHashSet<>();

    @OneToMany(mappedBy = "sku")
    private Set<Inventory> inventories = new LinkedHashSet<>();

    @OneToMany(mappedBy = "sku")
    private Set<OrderItem> orderItems = new LinkedHashSet<>();

    public Integer getId () {
        return id;
    }

    public void setId (Integer id) {
        this.id = id;
    }

    public com.avion.avion_concept.jpa.Product getProduct () {
        return product;
    }

    public void setProduct (com.avion.avion_concept.jpa.Product product) {
        this.product = product;
    }

    public UUID getSku () {
        return sku;
    }

    public void setSku (UUID sku) {
        this.sku = sku;
    }

    public BigDecimal getPrice () {
        return price;
    }

    public void setPrice (BigDecimal price) {
        this.price = price;
    }

    public Integer getStockLevel () {
        return stockLevel;
    }

    public void setStockLevel (Integer stockLevel) {
        this.stockLevel = stockLevel;
    }

    public String getMaterial () {
        return material;
    }

    public void setMaterial (String material) {
        this.material = material;
    }

    public String getDimensions () {
        return dimensions;
    }

    public void setDimensions (String dimensions) {
        this.dimensions = dimensions;
    }

    public BigDecimal getWeight () {
        return weight;
    }

    public void setWeight (BigDecimal weight) {
        this.weight = weight;
    }

    public String getColor () {
        return color;
    }

    public void setColor (String color) {
        this.color = color;
    }

    public String getFinish () {
        return finish;
    }

    public void setFinish (String finish) {
        this.finish = finish;
    }

    public Set<Cart> getCarts () {
        return carts;
    }

    public void setCarts (Set<Cart> carts) {
        this.carts = carts;
    }

    public Set<Inventory> getInventories () {
        return inventories;
    }

    public void setInventories (Set<Inventory> inventories) {
        this.inventories = inventories;
    }

    public Set<OrderItem> getOrderItems () {
        return orderItems;
    }

    public void setOrderItems (Set<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }

}
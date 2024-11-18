package com.avion.avion_concept.jpa;

import jakarta.persistence.*;
import org.hibernate.annotations.ColumnDefault;

@Entity
@Table(name = "\"Inventory\"")
public class Inventory {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "Inventory_id_gen")
    @SequenceGenerator(name = "Inventory_id_gen", sequenceName = "Inventory_inventory_id_seq", allocationSize = 1)
    @Column(name = "inventory_id", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "sku_id", nullable = false)
    private ProductSkus sku;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "supplier_id", nullable = false)
    private Supplier supplier;

    @ColumnDefault("0")
    @Column(name = "stock_level")
    private Integer stockLevel;

    @Column(name = "reorder_threshold")
    private Integer reorderThreshold;

    @Column(name = "storage_location")
    private String storageLocation;

    public Integer getId () {
        return id;
    }

    public void setId (Integer id) {
        this.id = id;
    }

    public ProductSkus getSku () {
        return sku;
    }

    public void setSku (ProductSkus sku) {
        this.sku = sku;
    }

    public Supplier getSupplier () {
        return supplier;
    }

    public void setSupplier (Supplier supplier) {
        this.supplier = supplier;
    }

    public Integer getStockLevel () {
        return stockLevel;
    }

    public void setStockLevel (Integer stockLevel) {
        this.stockLevel = stockLevel;
    }

    public Integer getReorderThreshold () {
        return reorderThreshold;
    }

    public void setReorderThreshold (Integer reorderThreshold) {
        this.reorderThreshold = reorderThreshold;
    }

    public String getStorageLocation () {
        return storageLocation;
    }

    public void setStorageLocation (String storageLocation) {
        this.storageLocation = storageLocation;
    }

}
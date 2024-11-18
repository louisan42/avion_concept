package com.avion.avion_concept.jpa;

import jakarta.persistence.*;
import org.hibernate.annotations.ColumnDefault;

import java.time.Instant;

@Entity
@Table(name = "\"Products\"")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "Products_id_gen")
    @SequenceGenerator(name = "Products_id_gen", sequenceName = "Products_product_id_seq", allocationSize = 1)
    @Column(name = "product_id", nullable = false)
    private Integer id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "description", length = Integer.MAX_VALUE)
    private String description;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "subcategory_id")
    private SubCategory subcategory;

    @ColumnDefault("CURRENT_TIMESTAMP")
    @Column(name = "created_at")
    private Instant createdAt;

    public Integer getId () {
        return id;
    }

    public void setId (Integer id) {
        this.id = id;
    }

    public String getName () {
        return name;
    }

    public void setName (String name) {
        this.name = name;
    }

    public String getDescription () {
        return description;
    }

    public void setDescription (String description) {
        this.description = description;
    }

    public SubCategory getSubcategory () {
        return subcategory;
    }

    public void setSubcategory (SubCategory subcategory) {
        this.subcategory = subcategory;
    }

    public Instant getCreatedAt () {
        return createdAt;
    }

    public void setCreatedAt (Instant createdAt) {
        this.createdAt = createdAt;
    }

    @Override
    public String toString () {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", subcategory=" + subcategory +
                ", createdAt=" + createdAt +
                '}';
    }
}
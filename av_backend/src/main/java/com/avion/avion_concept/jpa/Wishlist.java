package com.avion.avion_concept.jpa;

import jakarta.persistence.*;
import org.hibernate.annotations.ColumnDefault;

import java.time.Instant;

@Entity
@Table(name = "\"Wishlist\"")
public class Wishlist {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "Wishlist_id_gen")
    @SequenceGenerator(name = "Wishlist_id_gen", sequenceName = "Wishlist_wishlist_id_seq", allocationSize = 1)
    @Column(name = "wishlist_id", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "customer_id", nullable = false)
    private Customer customer;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "product_id", nullable = false)
    private Product product;

    @ColumnDefault("CURRENT_TIMESTAMP")
    @Column(name = "added_date")
    private Instant addedDate;

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

    public Product getProduct () {
        return product;
    }

    public void setProduct (Product product) {
        this.product = product;
    }

    public Instant getAddedDate () {
        return addedDate;
    }

    public void setAddedDate (Instant addedDate) {
        this.addedDate = addedDate;
    }

}
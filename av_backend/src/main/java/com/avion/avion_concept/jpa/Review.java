package com.avion.avion_concept.jpa;

import jakarta.persistence.*;
import org.hibernate.annotations.ColumnDefault;

import java.time.Instant;

@Entity
@Table(name = "\"Reviews\"")
public class Review {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "Reviews_id_gen")
    @SequenceGenerator(name = "Reviews_id_gen", sequenceName = "Reviews_review_id_seq", allocationSize = 1)
    @Column(name = "review_id", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "product_id", nullable = false)
    private Product product;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "customer_id", nullable = false)
    private Customer customer;

    @Column(name = "rating", nullable = false)
    private Integer rating;

    @Column(name = "review_text", length = Integer.MAX_VALUE)
    private String reviewText;

    @ColumnDefault("CURRENT_TIMESTAMP")
    @Column(name = "review_date")
    private Instant reviewDate;

    public Integer getId () {
        return id;
    }

    public void setId (Integer id) {
        this.id = id;
    }

    public Product getProduct () {
        return product;
    }

    public void setProduct (Product product) {
        this.product = product;
    }

    public Customer getCustomer () {
        return customer;
    }

    public void setCustomer (Customer customer) {
        this.customer = customer;
    }

    public Integer getRating () {
        return rating;
    }

    public void setRating (Integer rating) {
        this.rating = rating;
    }

    public String getReviewText () {
        return reviewText;
    }

    public void setReviewText (String reviewText) {
        this.reviewText = reviewText;
    }

    public Instant getReviewDate () {
        return reviewDate;
    }

    public void setReviewDate (Instant reviewDate) {
        this.reviewDate = reviewDate;
    }

}
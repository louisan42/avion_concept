package com.avion.avion_concept.jpa;

import jakarta.persistence.*;
import org.hibernate.annotations.ColumnDefault;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.LinkedHashSet;
import java.util.Set;

@Entity
@Table(name = "\"Orders\"")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "Orders_id_gen")
    @SequenceGenerator(name = "Orders_id_gen", sequenceName = "Orders_order_id_seq", allocationSize = 1)
    @Column(name = "order_id", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "customer_id", nullable = false)
    private Customer customer;

    @ColumnDefault("CURRENT_TIMESTAMP")
    @Column(name = "order_date")
    private Instant orderDate;

    @Column(name = "delivery_date")
    private Instant deliveryDate;

    @Column(name = "status", length = 50)
    private String status;

    @Column(name = "total_price", nullable = false, precision = 10, scale = 2)
    private BigDecimal totalPrice;

    @OneToMany(mappedBy = "order")
    private Set<OrderItem> orderItems = new LinkedHashSet<>();

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

    public Instant getOrderDate () {
        return orderDate;
    }

    public void setOrderDate (Instant orderDate) {
        this.orderDate = orderDate;
    }

    public Instant getDeliveryDate () {
        return deliveryDate;
    }

    public void setDeliveryDate (Instant deliveryDate) {
        this.deliveryDate = deliveryDate;
    }

    public String getStatus () {
        return status;
    }

    public void setStatus (String status) {
        this.status = status;
    }

    public BigDecimal getTotalPrice () {
        return totalPrice;
    }

    public void setTotalPrice (BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Set<OrderItem> getOrderItems () {
        return orderItems;
    }

    public void setOrderItems (Set<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }

}
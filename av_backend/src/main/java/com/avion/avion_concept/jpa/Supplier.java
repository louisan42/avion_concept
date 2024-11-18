package com.avion.avion_concept.jpa;

import jakarta.persistence.*;

import java.util.LinkedHashSet;
import java.util.Set;

@Entity
@Table(name = "\"Suppliers\"")
public class Supplier {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "Suppliers_id_gen")
    @SequenceGenerator(name = "Suppliers_id_gen", sequenceName = "Suppliers_supplier_id_seq", allocationSize = 1)
    @Column(name = "supplier_id", nullable = false)
    private Integer id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "contact_info")
    private String contactInfo;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "address_id")
    private Address address;

    @OneToMany(mappedBy = "supplier")
    private Set<Inventory> inventories = new LinkedHashSet<>();

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

    public String getContactInfo () {
        return contactInfo;
    }

    public void setContactInfo (String contactInfo) {
        this.contactInfo = contactInfo;
    }

    public Address getAddress () {
        return address;
    }

    public void setAddress (Address address) {
        this.address = address;
    }

    public Set<Inventory> getInventories () {
        return inventories;
    }

    public void setInventories (Set<Inventory> inventories) {
        this.inventories = inventories;
    }

}
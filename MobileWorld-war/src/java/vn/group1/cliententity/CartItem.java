/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.group1.cliententity;

import vn.group1.entity.Product;

/**
 *
 * @author junev
 */
public class CartItem {
    private Product product;
    private int quantity;
    private int finalPrice;


    /**
     * @return the product
     */
    public Product getProduct() {
        return product;
    }

    public CartItem(Product product, int quantity, int finalPrice) {
        this.product = product;
        this.quantity = quantity;
        this.finalPrice = finalPrice;
    }

    /**
     * @param product the product to set
     */
    public void setProduct(Product product) {
        this.product = product;
    }

    /**
     * @return the quantity
     */
    public int getQuantity() {
        return quantity;
    }

    /**
     * @param quantity the quantity to set
     */
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    /**
     * @return the finalPrice
     */
    public int getFinalPrice() {
        return finalPrice;
    }

    /**
     * @param finalPrice the finalPrice to set
     */
    public void setFinalPrice(int finalPrice) {
        this.finalPrice = finalPrice;
    }

  
}

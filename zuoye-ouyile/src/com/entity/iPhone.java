package com.entity;

public class iPhone {

    private int id;
    private String name;
    private float price;
    private String color;
    private String memory;

    public iPhone(int id, String name, float price, String color, String memory) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.color = color;
        this.memory = memory;
    }

    public iPhone() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPrice() {
        return price;
    }

    @Override
    public String toString() {
        return "iPhone{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", color='" + color + '\'' +
                ", memory='" + memory + '\'' +
                '}';
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getMemory() {
        return memory;
    }

    public void setMemory(String memory) {
        this.memory = memory;
    }
}

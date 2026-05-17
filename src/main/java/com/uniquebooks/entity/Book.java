package com.uniquebooks.entity;

public class Book {
    private int id;
    private String title;
    private String isbn;
    private String genre;
    private String author;
    private String publishedDate;
    private double price;
    private int stock;
    private String description;
    private String imagePath;

    public Book() {
    }

    public Book(int id, String title,String isbn, String genre, String author, String publishedDate, double price, int stock, String description, String imagePath) {
        this.id = id;
        this.title = title;
        this.isbn = isbn;
        this.genre = genre;
        this.author = author;
        this.publishedDate = publishedDate;
        this.price = price;
        this.stock = stock;
        this.description = description;
        this.imagePath = imagePath;
    }
    public int getId() {
        return id;
    }
    public void setId(int id){
        this.id = id;
    }

    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getIsbn() {
        return isbn;
    }
    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }
    public String getGenre() {
        return genre;
    }
    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getAuthor() {
        return author;
    }
    public void setAuthor(String author) {
        this.author = author;
    }
    public String getPublishedDate() {
        return publishedDate;
    }
    public void setPublishedDate(String publishedDate) {
        this.publishedDate = publishedDate;
    }
    public double getPrice() {
        return price;
    }
    public void setPrice(double price) {
        this.price = price;
    }
    public int getStock() {
        return stock;
    }
    public void setStock(int stock) {
        this.stock = stock;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public String getImagePath() {
        return imagePath;
    }
    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    @Override
    public String toString() {
        return "Book{"+ "id=" + id +",title='" + title + '\''+ ",isdn='"+ isbn+ '\''+ ",genre='" + genre + '\'' +",author='" +author + '\'' + ", publishedDate='" + publishedDate + '\'' + ", price=" + price + ", stock=" + stock + ", description='" + description + '\'' + ", imagePath='" + imagePath + '\'' + '}';
    }

}

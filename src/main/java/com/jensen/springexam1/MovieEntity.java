package com.jensen.springexam1;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "movie")
@Data

public class MovieEntity {
    public String getTier() {
        return tier;
    }

    public void setTier(String tier) {
        this.tier = tier;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Column(unique = true)
    private String title;
    private String tier;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }
}

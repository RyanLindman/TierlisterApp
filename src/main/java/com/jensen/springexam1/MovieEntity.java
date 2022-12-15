package com.jensen.springexam1;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "movie")
@Data

public class MovieEntity {


    @Column(unique = true)
    private String title;
   // private String director;
   // private String description;


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

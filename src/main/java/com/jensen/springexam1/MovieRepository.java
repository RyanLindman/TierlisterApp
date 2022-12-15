package com.jensen.springexam1;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MovieRepository extends JpaRepository <MovieEntity, Long> {
    MovieEntity findByTitle(String title);

}

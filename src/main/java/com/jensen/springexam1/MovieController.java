package com.jensen.springexam1;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.rmi.ServerException;
import java.util.Optional;

@RestController
@RequestMapping(path = "/movies")

public class MovieController {
    @Autowired
    private MovieRepository movieRepository;
    @GetMapping(path = "/all")
    public @ResponseBody Iterable <MovieEntity> getAllMovies(){

        return movieRepository.findAll();
    }
    @PostMapping(path = "/create", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<MovieEntity> create(@RequestBody MovieEntity newMovie) {
        // ..
        MovieEntity movie = movieRepository.save(newMovie);

        return new ResponseEntity<>(movie, HttpStatus.CREATED);
    }
    @DeleteMapping(path = "/delete", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<MovieEntity> delete(@RequestBody MovieEntity deletedMovie){
        movieRepository.delete(deletedMovie);
        return new ResponseEntity<>(deletedMovie,HttpStatus.OK);

    }
    @PutMapping(path = "/update", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<MovieEntity> update(@RequestBody MovieEntity updatedMovie){

      movieRepository.save(updatedMovie);
      return new ResponseEntity<>(updatedMovie, HttpStatus.CREATED);

    }
}

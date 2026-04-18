package com.watch.stream.system.rest

import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.CrossOrigin
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@CrossOrigin(origins = ["http://localhost:4200"])
@RequestMapping("/movies", produces = ["application/json"])
class MovieController {

    @GetMapping
    fun getMovies(): ResponseEntity<List<String>> {
        return ResponseEntity.ok(listOf("Avatar", "The Matrix", "The Godfather", "The Dark Knight"))
    }
}
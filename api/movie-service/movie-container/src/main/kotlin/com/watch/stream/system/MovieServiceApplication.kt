package com.watch.stream.system

import org.springframework.boot.autoconfigure.SpringBootApplication

@SpringBootApplication(scanBasePackages = ["com.watch.stream.system"])
class MovieServiceApplication {
    companion object {
        @JvmStatic
        fun main(args: Array<String>) {
            org.springframework.boot.SpringApplication.run(MovieServiceApplication::class.java, *args)
        }
    }
}
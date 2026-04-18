import { Component, inject } from '@angular/core';
import { MovieService } from './services/movie-service';
import { toSignal } from '@angular/core/rxjs-interop';

@Component({
  selector: 'ws-movies',
  imports: [],
  templateUrl: './movies.html',
  styleUrl: './movies.scss',
})
export class Movies {
  private readonly movieService = inject(MovieService);
  movies = toSignal(this.movieService.getMovies());
}

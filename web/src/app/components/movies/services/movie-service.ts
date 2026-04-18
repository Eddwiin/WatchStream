import { inject, Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root',
})
export class MovieService {
  private readonly httpClient = inject(HttpClient);

  getMovies() {
    return this.httpClient.get<String[]>('http://localhost:8181/api/movies');
  }
}

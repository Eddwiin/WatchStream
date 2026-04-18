import { Component, signal } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { Movies } from './components/movies/movies';

@Component({
  selector: 'ws-root',
  imports: [RouterOutlet, Movies],
  templateUrl: './app.html',
  styleUrl: './app.scss',
})
export class App {
  protected readonly title = signal('web');
}

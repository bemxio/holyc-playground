#include "src/SDLExterns.HH"

U0 Main()
{
  SDL_Init(SDL_INIT_VIDEO);

  U0* window = SDL_CreateWindow("Hello from HolyC!", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, 640, 480, 0);
  U0* renderer = SDL_CreateRenderer(window, -1, 0);
  U0* event = MAlloc(56); // sizeof(SDL_Event) == 56

  while (1)
  {
    while (SDL_PollEvent(event))
    {
      if (*event(I32*) == SDL_QUIT)
      {
        goto end;
      }
    }

    SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
    SDL_RenderClear(renderer);
    SDL_RenderPresent(renderer);
  }

end:
  Free(event);
  SDL_DestroyRenderer(renderer);
  SDL_DestroyWindow(window);

  SDL_Quit;
}
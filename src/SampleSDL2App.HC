#include "include/SDL.HH"

#define WINDOW_WIDTH 640
#define WINDOW_HEIGHT 480

U0 Main()
{
  SDL_Init(SDL_INIT_VIDEO);
  IMG_Init(IMG_INIT_PNG);

  U0* window = SDL_CreateWindow("Hello from HolyC!", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, WINDOW_WIDTH, WINDOW_HEIGHT, 0);
  U0* renderer = SDL_CreateRenderer(window, -1, 0);
  U0* event = MAlloc(56); // sizeof(SDL_Event) == 56

  U0* texture = IMG_LoadTexture(renderer, "assets/templeos.png");
  I32* textureRect = MAlloc(sizeof(I32) * 4);

  textureRect[0] = (WINDOW_WIDTH - 560) / 2; // x
  textureRect[1] = (WINDOW_HEIGHT - 470) / 2; // y
  textureRect[2] = 560; // width
  textureRect[3] = 470; // height

  Bool loop = 1;

  while (loop)
  {
    while (SDL_PollEvent(event))
    {
      if (*event(I32*) == SDL_QUIT)
      {
        loop = 0;
      }
    }

    SDL_SetRenderDrawColor(renderer, 85, 255, 255, 255);
    SDL_RenderClear(renderer);
    SDL_RenderCopy(renderer, texture, NULL, textureRect);

    SDL_RenderPresent(renderer);
  }

  Free(event);
  SDL_DestroyTexture(texture);
  SDL_DestroyRenderer(renderer);
  SDL_DestroyWindow(window);

  IMG_Quit;
  SDL_Quit;
}
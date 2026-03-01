extern "c" I32 SDL_Init(U32 flags);
extern "c" U0* SDL_CreateWindow(U8* title, I32 x, I32 y, I32 w, I32 h, U32 flags);
extern "c" U0* SDL_CreateRenderer(U0* window, I32 index, U32 flags);
extern "c" I32 SDL_PollEvent(U0* event);
extern "c" I32 SDL_SetRenderDrawColor(U0* renderer, U8 r, U8 g, U8 b, U8 a);
extern "c" I32 SDL_RenderClear(U0* renderer);
extern "c" U0 SDL_RenderPresent(U0* renderer);
extern "c" U0 SDL_DestroyRenderer(U0* renderer);
extern "c" U0 SDL_DestroyWindow(U0* window);
extern "c" U0 SDL_Quit();

#define SDL_INIT_VIDEO 0x00000020
#define SDL_WINDOWPOS_CENTERED 0x2FFF0000
#define SDL_QUIT 0x100

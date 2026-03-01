// SDL.h
extern "c" U0* SDL_CreateRenderer(U0* window, I32 index, U32 flags);
extern "c" U0* SDL_CreateWindow(U8* title, I32 x, I32 y, I32 w, I32 h, U32 flags);
extern "c" U0 SDL_DestroyRenderer(U0* renderer);
extern "c" U0 SDL_DestroyTexture(U0* texture);
extern "c" U0 SDL_DestroyWindow(U0* window);
extern "c" I32 SDL_Init(U32 flags);
extern "c" I32 SDL_PollEvent(U0* event);
extern "c" U0 SDL_Quit();
extern "c" I32 SDL_RenderClear(U0* renderer);
extern "c" I32 SDL_RenderCopy(U0* renderer, U0* texture, U0* srcrect, U0* dstrect);
extern "c" U0 SDL_RenderPresent(U0* renderer);
extern "c" I32 SDL_SetRenderDrawColor(U0* renderer, U8 r, U8 g, U8 b, U8 a);

#define SDL_INIT_VIDEO 0x00000020
#define SDL_QUIT 0x100
#define SDL_WINDOWPOS_CENTERED 0x2FFF0000

// SDL_image.h
extern "c" I32 IMG_Init(U32 flags);
extern "c" U0* IMG_LoadTexture(U0* renderer, U8* file);
extern "c" U0 IMG_Quit();

#define IMG_INIT_PNG 0x00000002

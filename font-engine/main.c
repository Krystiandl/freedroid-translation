#include <stdlib.h>
#include <stdio.h>
#include <SDL/SDL.h>
#include <SDL/SDL_ttf.h>
#include <SDL_Pango.h>
#include <unistd.h>

int main( int argc, char *argv[ ] )
{

    printf( "TTF_Init() : %d\n", TTF_Init()) ;
/* Other : with pango */

    SDLPango_Context *context = SDLPango_CreateContext();
    SDLPango_SetDefaultColor(context, MATRIX_TRANSPARENT_BACK_WHITE_LETTER);
    SDLPango_SetMinimumSize(context, 640, 0);
    SDLPango_SetMarkup(context, "This is <i>markup</i> text.", -1);
    int w = SDLPango_GetLayoutWidth(context);
    int h = SDLPango_GetLayoutHeight(context);
    int margin_x = 10;
    int margin_y = 10;
    SDL_Surface *surface = SDL_CreateRGBSurface(SDL_SWSURFACE,
        w + margin_x * 2, h + margin_y * 2,
        32, (Uint32)(255 << (8 * 3)), (Uint32)(255 << (8 * 2)),
        (Uint32)(255 << (8 * 1)), 255);
    SDLPango_Draw(context, surface, margin_x, margin_y);
    sleep(10) ;
    SDL_FreeSurface(surface);
    SDLPango_FreeContext(context);
    return EXIT_SUCCESS;
}

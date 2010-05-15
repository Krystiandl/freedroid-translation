// #include <pango-1.0/pango.h>
// #include <pango-1.0/pangoft2.h>
#include "SDL_Pango.h"
#include <stdlib.h>
#include "SDL.h"

main(int argc, char *argv[])
{
    if ( SDL_Init(SDL_INIT_AUDIO|SDL_INIT_VIDEO) < 0 ) {
        fprintf(stderr, "Unable to init SDL: %s\n", SDL_GetError());
        exit(1);
    } else {
        puts("Initialisation of the SDL library success") ;
    }
    if (SDLPango_Init() != 0) {
        perror("Failed to initialize the pango library") ;
    } else {

        puts ("Initialisation of the pango library success") ;
        /*The operation of SDL_Pango is done via context.*/
        SDLPango_Context *context = SDLPango_CreateContext();
        /* Specify default colors and minimum surface size. */
        SDLPango_SetDefaultColor(context, MATRIX_TRANSPARENT_BACK_WHITE_LETTER);
        SDLPango_SetMinimumSize(context, 640, 0);
        /* Set markup text.*/
        SDLPango_SetMarkup(context, "This is <i>markup</i> text.", -1);
        /* Now you can get the size of surface.*/
        int w = SDLPango_GetLayoutWidth(context);
        int h = SDLPango_GetLayoutHeight(context);
        /* Create surface to draw. */
        int margin_x = 10;
        int margin_y = 10;
        SDL_Surface *surface = SDL_CreateRGBSurface(SDL_SWSURFACE,
            w + margin_x * 2, h + margin_y * 2,
            32, (Uint32)(255 << (8 * 3)), (Uint32)(255 << (8 * 2)),
            (Uint32)(255 << (8 * 1)), 255);

        /* And draw on it.*/

        SDLPango_Draw(context, surface, margin_x, margin_y);

        /* You must free the surface by yourself. */

        SDL_FreeSurface(surface);
    }
    SDL_Surface *screen;
    screen = SDL_SetVideoMode(640, 480, 16, SDL_SWSURFACE);
    if ( screen == NULL ) {
        fprintf(stderr, "Unable to set 640x480 video: %s\n", SDL_GetError());
        exit(1);
    } else {
        puts("success to set 640x480 video mode") ;
        sleep(3);
    }
    atexit(SDL_Quit);
}
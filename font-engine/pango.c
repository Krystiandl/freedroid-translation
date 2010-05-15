// #include <pango-1.0/pango.h>
// #include <pango-1.0/pangoft2.h>
#include "SDL_Pango.h"
#include <stdlib.h>
#include "SDL.h"

/* A short example of the Pango use */
main(int argc, char *argv[])
{
    if ( SDL_Init(SDL_INIT_EVERYTHING) < 0 ) {
        fprintf(stderr, "Unable to init SDL: %s\n", SDL_GetError());
        exit(1);
    }
    puts("Initialisation of the SDL library succeed") ;

    if (SDLPango_Init() != 0) {
        perror("Failed to initialize the pango library") ;
        exit(1) ;
    }
    puts ("Initialisation of SDL_pango library succeed") ;

    /*The operation of SDL_Pango is done via context.*/
    SDLPango_Context *context = SDLPango_CreateContext();
    /* Specify default colors and minimum surface size. */
    SDLPango_SetDefaultColor(context, MATRIX_TRANSPARENT_BACK_WHITE_LETTER );
    SDLPango_SetMinimumSize( context, 640, 0 );
    /* Set markup text.*/
    SDLPango_SetMarkup(context, "This is <i>markup</i> text.", -1);
    /* Now you can get the size of surface.*/
    int w = SDLPango_GetLayoutWidth(context);
    int h = SDLPango_GetLayoutHeight(context);
    /* Create surface to draw. */
    int margin_x = 10;
    int margin_y = 10;

    SDL_Surface *screen;
    screen = SDL_SetVideoMode(640, 480, 16, SDL_SWSURFACE);
    if ( screen == NULL ) {
        fprintf(stderr, "Unable to set 640x480 video: %s\n", SDL_GetError());
        exit(1);
    }
    puts("success to set 640x480 video mode") ;

    SDL_Surface * surface = SDL_CreateRGBSurface(SDL_SWSURFACE,
        w + margin_x * 2, h + margin_y * 2,
        32, (Uint32)(255 << (8 * 3)), (Uint32)(255 << (8 * 2)),
        (Uint32)(255 << (8 * 1)), 255);
    if ( surface != NULL ) {
        SDLPango_Draw( context , surface , margin_x , margin_y );
        SDL_BlitSurface( surface, NULL, screen, NULL) ;
        SDL_Flip( screen );
        SDL_Delay( 2000 );
    }

    /* And draw on it. margin_x,y gives the space between
    the context and the edges of the SDL_Surface*/

    SDL_Surface * hello = SDL_LoadBMP( "hello.bmp" );
    if ( hello != NULL ){
        SDL_BlitSurface( hello , NULL , screen, NULL );
        SDL_Flip( screen );
        SDL_Delay( 2000 );
    }

    SDL_FreeSurface(hello) ;
    SDL_FreeSurface(surface);
    SDL_FreeSurface(screen) ;

    atexit(SDL_Quit);
    return 0 ;
}
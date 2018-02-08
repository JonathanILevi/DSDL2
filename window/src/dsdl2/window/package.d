/**
The Window submodule of DSDL2.  The base for every part.



*/


module dsdl2.window;


import std.stdio;


import cst;

import derelict.sdl2.sdl	;



/**	Initialize SDL*/
static this () {
	DerelictSDL2.load();
	// Initialise SDL
	if (SDL_Init(SDL_INIT_VIDEO) != 0) {
		writeln("SDL_Init: ", SDL_GetError());
	}
}
/**	Shutdown SDL.  (Release memory, etc)*/
static ~this () {
	"sdl ~this".writeln;
	SDL_Quit();
}






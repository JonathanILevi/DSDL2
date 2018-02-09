/**
The Window submodule of DSDL2.  The base for every part.



*/


module dsdl2.window;


import std.stdio;


import cst_;
import xyz;

import derelict.sdl2.sdl	;
import std.string	: toStringz;



/**	Initialize SDL*/
static this () {
	DerelictSDL2.load();
	// Initialise SDL
	if (SDL_Init(SDL_INIT_VIDEO) != 0) {
		writeln("SDL_Init: ", SDL_GetError());
	}
}
/**	Release SDL.  (Release memory, etc)*/
static ~this () {
	"sdl ~this".writeln;
	SDL_Quit();
}









class Window {
	/**	Init Window with default position.
	*/
	this (string title, int[2] size) {
		this(title, [SDL_WINDOWPOS_UNDEFINED,SDL_WINDOWPOS_UNDEFINED], size);
	}
	/**	Init Window with explicit position.
	*/
	this (string title, int[2] pos, int[2] size) {
		title.writeln;

		// Create a window
		sdl_window = SDL_CreateWindow	(	title.toStringz	,
				pos.x	,
				pos.y	,
				size.x	,
				size.y	,
				SDL_WINDOW_OPENGL	,
			);
	}
	/**	Release Window.  (Release memory, etc)*/
	~this () {
		if (sdl_window !is null) {
			SDL_DestroyWindow(sdl_window);
		}
	}
	

	SDL_Window* sdl_window;

}







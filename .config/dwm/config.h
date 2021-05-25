/* vim: set ts=8 sw=8 tw=0 noet : */
/* See LICENSE file for copyright and license details. */
/* Constants */
#define TERMINAL "st"
#define TERMCLASS "St"

/* appearance */
static unsigned int borderpx  = 2;	/* border pixel of windows */
static unsigned int snap      = 16;	/* snap pixel */
static unsigned int gappih    = 80;	/* horiz inner gap between windows */
static unsigned int gappiv    = 80;	/* vert inner gap between windows */
static unsigned int gappoh    = 80;	/* horiz outer gap between windows and screen edge */
static unsigned int gappov    = 80;	/* vert outer gap between windows and screen edge */
static int swallowfloating    = 0;	/* 1 means swallow floating windows by default */
static int smartgaps          = 0;	/* 1 means no outer gap when there is only one window */
static int showbar            = 1;	/* 0 means no bar */
static int topbar             = 1;	/* 0 means bottom bar */
static int focusonwheel       = 0;
static char *fonts[]          = { "monospace:size=10", "JoyPixels:pixelsize=10:antialias=true:autohint=true"  };

static char *colors[][3] = {
       /*		fg		bg		border   */
       [SchemeNorm] = { "#bbbbbb",	"#111111",	"#111111" },
       [SchemeSel]  = { "#eeeeee",	"#111111",	"#dc657c" },
};

static const unsigned int baralpha = 0xd0;
static const unsigned int borderalpha = 0;
static const unsigned int alphas[][3] = {
	/*			fg		bg		border */
	[SchemeNorm] = {	OPAQUE,		200,		200 },
	[SchemeSel]  = {	OPAQUE,		200,		255 },
};




typedef struct {
	const char *name;
	const void *cmd;
} Sp;
const char *spcmd1[] = {TERMINAL, "-n", "spterm", "-f", "monospace:size=16", "-g", "120x34", NULL };
const char *spcmd2[] = {TERMINAL, "-n", "spcalc", "-f", "monospace:size=16", "-g", "50x20", "-e", "bc", "-lq", NULL };
const char *spcmd3[] = {TERMINAL, "-n", "ncmpcpp",  "-g", "80x15-20+40", "-f", "monospace:size=10", "-e", "ncmpcpp", NULL };
static Sp scratchpads[] = {
	/* name          cmd  */
	{"spterm",      spcmd1},
	{"spcalc",      spcmd2},
	{"ncmpcpp",	spcmd3},
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	*/
	/* class	instance	title			tags mask	isfloating	isterminal	noswallow	monitor */
	{ "Gimp",	NULL,		NULL,			1 << 8,		0,		0,		0,		-1 },
	{ TERMCLASS,	NULL,		NULL,			0,		0,		1,		0,		-1 },
	{ NULL,		NULL,		"Event Tester",		0,		0,		0,		1,		-1 },
	{ NULL,		"spterm",	NULL,			SPTAG(0),	1,		1,		0,		-1 },
	{ NULL,		"spcalc",	NULL,			SPTAG(1),	1,		1,		0,		-1 },
	{ NULL,		"ncmpcpp",	NULL,			SPTAG(2),	1,		1,		0,		-1 },
	{ NULL,		NULL,		"popup",		0,		1,		0,		1,		-1 },
};

/* layout(s) */
static float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static int nmaster     = 1;    /* number of clients in master area */
static int resizehints = 0;    /* 1 means respect size hints in tiled resizals */
static int attachdirection = 4; /* 0 default, 1 above, 2 aside, 3 below, 4 bottom, 5 top */
#define FORCE_VSPLIT 1  /* nrowgrid layout: force two clients to always split vertically */
#include "vanitygaps.c"
static const Layout layouts[] = {
	/* symbol     arrange function */
 	{ "[]+",	tiletwo },
	/* { "TTT",	bstack },		/1* Master on top, slaves on bottom *1/ */

/*	{ "[@]",	spiral },		/* unused - Fibonacci spiral */
/*	{ "[\\]",	dwindle },		/* unuser - Decreasing in size right and leftward */

	/* { "[D]",	deck },			/1* Master on left, slaves in monocle-like mode on right *1/ */
 	/* { "[M]",	monocle },		/1* All windows on top of eachother *1/ */

	/* { "|M|",	centeredmaster },		/1* Master in middle, slaves on sides *1/ */
/*	{ ">M>",	centeredfloatingmaster },	/* Same but master floats */

/*	{ "===",	bstackhoriz}, */
	/* { "HHH",	grid }, */
/*	{ "###",	nrowgrid },*/
/*	{ "---",	horizgrid },
/*	{ ":::",	gaplessgrid }, */

	{ "><>",	NULL },			/* no layout function means floating behavior */
	{ NULL,		NULL },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static const char *termcmd[]  = { TERMINAL, NULL };

/*
 * Xresources preferences to load at startup
 */
ResourcePref resources[] = {
	{ "smartgaps",		INTEGER, &smartgaps },
};

#include <X11/XF86keysym.h>
#include "shiftview.c"

/* keys
 * http://wiki.robotz.com/index.php/Xorg:_keysymdef.h
 * /usr/include/X11/XF86keysym.h
 * */
static Key keys[] = {
	/* modifier		key	function	 argument */

	{ MODKEY,		XK_j,		focusstack,	{.i = INC(+1) } },	/* move focus */
	{ MODKEY,		XK_k,		focusstack,	{.i = INC(-1) } },
	{ MODKEY,		XK_v,		focusstack,	{.i = 0 } },
	{ MODKEY|ShiftMask,	XK_j,		pushstack,	{.i = INC(+1) } },	/* move window */
	{ MODKEY|ShiftMask,	XK_k,		pushstack,	{.i = INC(-1) } },
	{ MODKEY,		XK_space,	zoom,		{0} }, 			/* win focus */

	/* layouts */
	{ MODKEY|ShiftMask,	XK_r,	setlayout,	{.v = &layouts[0]} },	/* tiletwo */
	{ MODKEY|ShiftMask,	XK_f,	setlayout,	{.v = &layouts[1]} },	/* floating */
	/* { MODKEY|ShiftMask,	XK_t,	setlayout,	{.v = &layouts[0]} },	/1* tile *1/ */
	/* { MODKEY|ShiftMask,	XK_b,	setlayout,	{.v = &layouts[1]} },	/1* bstack *1/ */
	/* { MODKEY|ShiftMask,	XK_d,	setlayout,	{.v = &layouts[2]} },	/1* deck *1/ */
	/* { MODKEY|ShiftMask,	XK_c,	setlayout,	{.v = &layouts[3]} },	/1* monocle *1/ */
	/* { MODKEY|ShiftMask,	XK_v,	setlayout,	{.v = &layouts[4]} },	/1* centeredmaster *1/ */
	/* { MODKEY|ShiftMask,	XK_g,	setlayout,	{.v = &layouts[5]} },	/1* grid *1/ */


	/* toggles */
	{ MODKEY,		XK_a,		togglegaps,	{0} },	/* toggle gaps */
	{ MODKEY|ShiftMask,	XK_a,		defaultgaps,	{0} },	/* reset gaps*/
	{ MODKEY,		XK_b,		togglebar,	{0} },	/* toggle bar */
	{ MODKEY,		XK_f,		togglefullscr,	{0} },	/* fullscreen */
	{ MODKEY,		XK_q,		killclient,	{0} },	/* kill window */
	{ MODKEY|ShiftMask|ControlMask, XK_q,	quit,		{0} },

	{ MODKEY|ShiftMask,	XK_space,	togglefloating,	{0} },		/* floating */
	{ MODKEY,		XK_s,		togglesticky,	{0} },		/* sticky */
	{ MODKEY,		XK_0,		view,		{.ui = ~0 } },	/* view all windows */
	{ MODKEY|ShiftMask,	XK_0,		tag,		{.ui = ~0 } },	/* window anywhere */
	{ MODKEY,		XK_Tab,		view,		{0} },		/* prev tag */


	/* params */
	{ MODKEY,		XK_z,		incrgaps,	{ .i = +3 } },	/* gaps */
	{ MODKEY|ShiftMask,	XK_z,		incrgaps,	{ .i = -3 } },
	{ MODKEY,		XK_o,		incnmaster,	{ .i = +1 } },	/* master count */
	{ MODKEY|ShiftMask,	XK_o,		incnmaster,	{ .i = -1 } },
	{ MODKEY,		XK_h,		setmfact,	{ .f = -0.05}},	/* master width */
	{ MODKEY,		XK_l,		setmfact,	{ .f = +0.05}},
	{ MODKEY,		XK_n,		togglescratch,	{ .ui = 2 } },	/* ncmpcpp */

	/* { MODKEY,		XK_m,		shiftview,	{ .i = +1 } },	/1* shift view *1/ */
	/* { MODKEY,		XK_n,		shiftview,	{ .i = -1 } }, */
	/* { MODKEY|ShiftMask,	XK_m,		shifttag,	{ .i = +1 } },	/1* shift tag *1/ */
	/* { MODKEY|ShiftMask,	XK_n,		shifttag,	{ .i = -1 } }, */

	/* TODO monitors support
	{ MODKEY,		XK_Left,	focusmon,	{.i = -1 } },
	{ MODKEY|ShiftMask,	XK_Left,	tagmon,		{.i = -1 } },
	{ MODKEY,		XK_Right,	focusmon,	{.i = +1 } },
	{ MODKEY|ShiftMask,	XK_Right,	tagmon,		{.i = +1 } }, */


	/* fix strange KP_Enter position */
	{ MODKEY,		XK_KP_Enter,	spawn,		{.v = termcmd } },
	{ MODKEY|ShiftMask,	XK_KP_Enter,	togglescratch,	{.ui = 0} },

	{ MODKEY,		XK_Return,	spawn,		{.v = termcmd } },
	{ MODKEY|ShiftMask,	XK_Return,	togglescratch,	{.ui = 0} },

	{ MODKEY,			XK_apostrophe,		togglescratch,	{ .ui = 1 } },	/* calc */

	TAGKEYS( XK_1, 0)
	TAGKEYS( XK_2, 1)
	TAGKEYS( XK_3, 2)
	TAGKEYS( XK_4, 3)
	TAGKEYS( XK_5, 4)
	TAGKEYS( XK_6, 5)
	TAGKEYS( XK_7, 6)
	TAGKEYS( XK_8, 7)
	TAGKEYS( XK_9, 8)
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
#ifndef __OpenBSD__
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button1,        sigdwmblocks,   {.i = 1} },
	{ ClkStatusText,        0,              Button2,        sigdwmblocks,   {.i = 2} },
	{ ClkStatusText,        0,              Button3,        sigdwmblocks,   {.i = 3} },
	{ ClkStatusText,        0,              Button4,        sigdwmblocks,   {.i = 4} },
	{ ClkStatusText,        0,              Button5,        sigdwmblocks,   {.i = 5} },
	{ ClkStatusText,        ShiftMask,      Button1,        sigdwmblocks,   {.i = 6} },
#endif
	{ ClkClientWin,		MODKEY,		Button1,	movemouse,	{0} }, /* float */
	{ ClkClientWin,		MODKEY,		Button2,	defaultgaps,	{0} },
	{ ClkClientWin,		MODKEY,		Button3,	resizemouse,	{0} }, /* float */
	{ ClkClientWin,		MODKEY,		Button4,	incrgaps,	{.i = +1} },
	{ ClkClientWin,		MODKEY,		Button5,	incrgaps,	{.i = -1} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
	{ ClkTagBar,		0,		Button4,	shiftview,	{.i = -1} },
	{ ClkTagBar,		0,		Button5,	shiftview,	{.i = 1} },
	{ ClkRootWin,		0,		Button2,	togglebar,	{0} },
};

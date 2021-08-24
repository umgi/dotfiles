/* vim: set ts=8 sw=8 tw=0 noet : */
/* See LICENSE file for copyright and license details. */
/* Constants */
#define TERMINAL "st"
#define TERMCLASS "St"

/* appearance */
static const unsigned int borderpx  = 1;	/* border pixel of windows */
static unsigned int snap      = 16;	/* snap pixel */
static unsigned int gappih    = 20;	/* horiz inner gap between windows */
static unsigned int gappiv    = 20;	/* vert inner gap between windows */
static unsigned int gappoh    = 20;	/* horiz outer gap between windows and screen edge */
static unsigned int gappov    = 20;	/* vert outer gap between windows and screen edge */
static int swallowfloating    = 0;	/* 1 means swallow floating windows by default */
static int smartgaps          = 0;	/* 1 means no outer gap when there is only one window */
static int showbar            = 0;	/* 0 means no bar */
static int topbar             = 1;	/* 0 means bottom bar */
static int focusonwheel       = 0;
static int lineheight         = 2;
static int linegap            = 3;
static const int baseo        = 20;
static const int basew        = 724;
/* static const int baseh        = 1020; /1* 1080 - gappih * 2 - bh *1/ */
static const int baseh        = 964; /* 1080 - gappih * 2 - bh */
static const int base169      = 407;
static char *fonts[]          = { "monospace:size=10", "JoyPixels:pixelsize=10:antialias=true:autohint=true"  };

static char normfgcolor[] = "#bbbbbb";
static char selfgcolor[]  = "#eeeeee";
static char accfgcolor[] = "#dc657c";
static char normbgcolor[] = "#111111";
static char selbgcolor[]  = "#111111";
static char accbgcolor[] = "#111111";
static char normbordercolor[] = "#111111";
static char selbordercolor[] = "#dc657c";
static char accbordercolor[] = "#111111";

static char *colors[][3] = {
       /*		fg		bg		border   */
       [SchemeNorm] = { normfgcolor,	normbgcolor,	normbordercolor },
       [SchemeSel]  = { selfgcolor,	selbgcolor,	selbordercolor },
       [SchemeAccent]  = { accfgcolor,	accbgcolor,	accbordercolor },
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
const char *spncmpcpp[] = {TERMINAL, "-n", "ncmpcpp",  "-g", "80x15", "-e", "ncmpcpp", NULL };
const char *splfcd[] = {TERMINAL, "-n", "lfcd",  "-g", "80x15", "-e", "zsh", "-i", "-c", "lfcd", NULL };
const char *spvim1[] = {TERMINAL, "-n", "spvim1", NULL };
const char *spvim2[] = {TERMINAL, "-n", "spvim2", NULL };
const char *sqbittorrent[] = {"qbittorrent", NULL };
const char *sncpamixer[] = {TERMINAL, "-n", "ncpamixer", "-e", "ncpamixer", NULL };
const char *spbrowser[] = {"firefox", NULL };
static Sp scratchpads[] = {
	/* name          cmd  */
	{"🌸",	spvim1},
	{"💠",	spvim2},
	/* {"┗",	spbrowser}, */
	{"🎐",	spncmpcpp},
	{"🌵",	splfcd},
	{"🍉",	sqbittorrent},
	{"🔈",	sncpamixer },
	/* {"spvim2",	spvim2}, */
	/* {"splfcd",	splfcd}, */
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	*/
	/* class, instance, title,
	 * tags mask, isfloating, isterminal, noswallow, monitor
	 * x, y, w, h, floatborderpx -- applies only on floating*/
	{
		"Gimp", NULL, NULL,
		1 << 8, 0, 0, 0, -1,
		0, 0, 0, 0, 2
	},{
		TERMCLASS, NULL, NULL,
		0, 0, 1, 0, -1,
		0, 0, 0, 0, 2
	}, {
		NULL, NULL, "Event Tester",
		0, 0, 0, 1, -1,
		0, 0, 0, 0, 2
	}, {
		NULL, "spvim1", NULL,
		SPTAG(0),1, 1, 0, 1,
		20, 20, basew, baseh, borderpx
	}, {
		NULL, "spvim2", NULL,
		SPTAG(1),1, 1, 0, 1,
		20, 20, basew, baseh, borderpx
	}, {
		/* "firefox", NULL, NULL, */
		/* SPTAG(2),1, 1, 0, 1, */
		/* 804, baseo, basew, baseh, borderpx */
	/* }, { */
		NULL, "ncmpcpp", NULL,
		SPTAG(2),1, 1, 0, 1,
		20, 20, basew, base169, borderpx
	}, {
		NULL, "lfcd", NULL,
		SPTAG(3),1, 1, 0, 1,
		20, 20, basew, base169, borderpx
	}, {
		NULL, "qbittorrent", NULL,
		SPTAG(4),1, 1, 0, 1,
		20, 20, 1880, 1000, borderpx
	}, {
		NULL, "ncpamixer", NULL,
		SPTAG(5),1, 1, 0, 1,
		20, 20, 1880, 1000, borderpx
	}, {
		NULL, NULL, "popup",
		0, 1, 0, 1, 1,
		10, 10, 0, 90, borderpx
	},
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
	{ "><>",	NULL },
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
	{ "foreground",		STRING,		&normfgcolor },
	{ "foreground",		STRING,		&selfgcolor },
	{ "background",		STRING,		&normbgcolor },
	{ "background",		STRING,		&selbgcolor },
	{ "normborder",		STRING,		&normbordercolor },
	{ "selborder",		STRING,		&selbordercolor },
	{ "accfgcolor",		STRING,		&accfgcolor },
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

	{ MODKEY|ShiftMask,	XK_r,		setlayout,	{.v = &layouts[0]} },	/* tiletwo */
	{ MODKEY|ShiftMask,	XK_f,		setlayout,	{.v = &layouts[1]} },	/* floating */

	{ MODKEY,		XK_o,		incnmaster,	{ .i = +1 } },	/* master count */
	{ MODKEY|ShiftMask,	XK_o,		incnmaster,	{ .i = -1 } },
	{ MODKEY,		XK_h,		setmfact,	{ .f = -0.05}},	/* master width */
	{ MODKEY,		XK_l,		setmfact,	{ .f = +0.05}},

	{ MODKEY|ShiftMask,	XK_a,		togglegaps,	{0} },
	{ MODKEY,		XK_b,		togglebar,	{0} },	/* toggle bar */
	{ MODKEY,		XK_f,		togglefullscr,	{0} },	/* fullscreen */
	{ MODKEY,		XK_c,		togglefloating,	{0} },
	{ MODKEY,		XK_s,		togglesticky,	{0} },
	{ MODKEY|ShiftMask,	XK_s,		defaultgaps,	{0} },
	{ MODKEY|ControlMask,	XK_q,		quit,		{0} },
	{ MODKEY,		XK_q,		killclient,	{0} },
	{ MODKEY,		XK_e,		togglescratch,	{.ui = 0} },	/* vim_one */
	{ MODKEY,		XK_r,		togglescratch,	{.ui = 1} },	/* vim_two */
	{ MODKEY,		XK_n,		togglescratch,	{.ui = 2} },	/* ncmpcpp */
	{ MODKEY,		XK_m,		togglescratch,	{.ui = 3} },	/* lfcd    */
	{ MODKEY,		XK_y,		togglescratch,	{.ui = 4} },	/* qbittorrent    */
	{ MODKEY,		XK_F4,		togglescratch,	{.ui = 5} },	/* ncpamixer    */

	{ MODKEY,		XK_Return,	spawn,		{.v = termcmd} },
	{ MODKEY,		XK_KP_Enter,	spawn,		{.v = termcmd} },

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

void
xtile(Monitor *m)
{
-	unsigned int i, n, h, mw, my, ty;
 	Client *c;
 
	Area *ga = m->pertag->areas[m->pertag->curtag], *ma = ga + 1, *sa = ga + 2, *a;
	unsigned int n, i, w, h, ms, ss;
	float f;
 
	/* print layout symbols */
	snprintf(m->ltsymbol, sizeof m->ltsymbol, "%c%c%c",
		(char[]){ '<', '^', '>', 'v' }[ga->dir],
		(char[]){ '-', '|' }[ma->dir],
		(char[]){ '-', '|' }[sa->dir]);

	/* calculate number of clients */
 	for (n = 0, c = nexttiled(m->clients); c; c = nexttiled(c->next), n++);
 	if (n == 0)
 		return;
 
	ma->n = MIN(n, m->nmaster), sa->n = n - ma->n;
	/* calculate area rectangles */
	f = ma->n == 0 ? 0 : (sa->n == 0 ? 1 : ga->fact / 2);
	if(ga->dir == DirHor || ga->dir == DirRotHor)
		ms = f * m->ww, ss = m->ww - ms,
		ma->x = ga->dir == DirHor ? 0 : ss, ma->y = 0, ma->fx = ma->x + ms, ma->fy = m->wh,
		sa->x = ga->dir == DirHor ? ms : 0, sa->y = 0, sa->fx = sa->x + ss, sa->fy = m->wh;
 	else
		ms = f * m->wh, ss = m->wh - ms,
		ma->x = 0, ma->y = ga->dir == DirVer ? 0 : ss, ma->fx = m->ww, ma->fy = ma->y + ms,
		sa->x = 0, sa->y = ga->dir == DirVer ? ms : 0, sa->fx = m->ww, sa->fy = sa->y + ss;
	/* tile clients */
	for(c = nexttiled(m->clients), i = 0; i < n; c = nexttiled(c->next), i++) {
		a = ma->n > 0 ? ma : sa;
		f = i == 0 || ma->n == 0 ? a->fact : 1, f /= --a->n + f;
		w = (a->dir == DirVer ? 1 : f) * (a->fx - a->x);
		h = (a->dir == DirHor ? 1 : f) * (a->fy - a->y);
		resize(c, m->wx + a->x, m->wy + a->y, w - 2 * c->bw, h - 2 * c->bw, False);
		a->x += a->dir == DirHor ? w : 0;
		a->y += a->dir == DirVer ? h : 0;
	}
 }

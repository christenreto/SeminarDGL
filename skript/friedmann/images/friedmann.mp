%
% friedmann.mp -- Graphs for paper on Friedmann equation
%
% (c) 2016 Prof Dr Andreas Mueller, Hochschule Rapperswil
%
verbatimtex
\documentclass{book}
\usepackage{times}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}
\usepackage{txfonts}
\begin{document}
etex;

%
% Erklärung des Skalenfaktors und seiner Wirkung auf Volumen und Dichte
%
beginfig(1)

numeric a, A;
a := 14;
A := 1.5 * a;

z0 = (0,0);

z1 = (-7 * a, 0);
z2 = ( 7 * a, 0);

def spunkt(expr p) =
	((p scaled a) shifted z1)
enddef;

def lpunkt(expr p) = 
	((p scaled A) shifted z2)
enddef;

z10 = spunkt((2,1));
z11 = spunkt((3,1));
z12 = spunkt((3,2));
z13 = spunkt((2,2));
fill z10--z11--z12--z13--cycle withcolor 0.7;
label(btex $\mu$ etex, 0.5[z10,z12]);

z20 = lpunkt((2,1));
z21 = lpunkt((3,1));
z22 = lpunkt((3,2));
z23 = lpunkt((2,2));
fill z20--z21--z22--z23--cycle withcolor 0.9;
label(btex $\mu$ etex, 0.5[z20,z22]);

pickup pencircle scaled 0.7pt;
for x = -5 step 1 until 5:
	draw spunkt((x,-5.5))--spunkt((x,5.5)) dashed dashpattern(off 2 on 0);
	draw spunkt((-5.5,x))--spunkt((5.5,x)) dashed dashpattern(off 2 on 0);
endfor;
for x = -3 step 1 until 3:
	draw lpunkt((x,-3.5))--lpunkt((x,3.5)) dashed dashpattern(off 3 on 0);
	draw lpunkt((-3.5,x))--lpunkt((3.5,x)) dashed dashpattern(off 3 on 0);
endfor;

z30 = spunkt((1,-3)) shifted (1,1);
z31 = spunkt((4,-3)) shifted (-1,1);
z32 = spunkt((4,-2)) shifted (-1,-1);
z33 = spunkt((1,-2)) shifted (1,-1);
fill z30--z31--z32--z33--cycle withcolor white;
z40 = lpunkt((1,-3)) shifted (1,1);
z41 = lpunkt((4,-3)) shifted (-1,1);
z42 = lpunkt((4,-2)) shifted (-1,-1);
z43 = lpunkt((1,-2)) shifted (1,-1);
fill z40--z41--z42--z43--cycle withcolor white;

pickup pencircle scaled 1pt;
drawarrow spunkt((-6,0))--spunkt((6,0));
drawarrow spunkt((0,-6))--spunkt((0,6));
drawarrow lpunkt((-4,0))--lpunkt((4,0));
drawarrow lpunkt((0,-4))--lpunkt((0,4));

pickup pencircle scaled 1.5pt;

draw spunkt((-2,-2))--spunkt((1,2)) withcolor 0.8;
draw lpunkt((-2,-2))--lpunkt((1,2)) withcolor 0.8;

pickup pencircle scaled 7pt;

draw spunkt((-2,-2)) withcolor blue;
draw lpunkt((-2,-2)) withcolor blue;
draw spunkt((1,2)) withcolor red;
draw lpunkt((1,2)) withcolor red;

draw spunkt((-3,0)) withcolor green;
draw lpunkt((-3,0)) withcolor green;
draw spunkt((-2,3)) withcolor green;
draw lpunkt((-2,3)) withcolor green;
draw spunkt((2,4)) withcolor green;
draw spunkt((1,-3)) withcolor green;
draw lpunkt((1,-3)) withcolor green;

draw spunkt((0,0)) withcolor green;
draw lpunkt((0,0)) withcolor green;

draw spunkt((3,-1)) withcolor green;
draw lpunkt((3,-1)) withcolor green;

draw spunkt((-4,5)) withcolor green;
draw spunkt((5,2)) withcolor green;
draw spunkt((4,-5)) withcolor green;
draw spunkt((-4,-4)) withcolor green;
draw spunkt((-5,-2)) withcolor green;
draw spunkt((0,-5)) withcolor green;
draw spunkt((5,5)) withcolor green;

label.ulft(btex $A$ etex, spunkt((-2,-2)));
label.urt(btex $B$ etex, spunkt((1,2)));
label.ulft(btex $A$ etex, lpunkt((-2,-2)));
label.urt(btex $B$ etex, lpunkt((1,2)));

pickup pencircle scaled 1.5pt;
z3 = spunkt((2,-3));
z4 = spunkt((3,-3));
z5 = 0.5[z3,z4];
z6 = lpunkt((2,-3));
z7 = lpunkt((3,-3));
z8 = 0.5[z6, z7];

def scalefactor(expr zone, ztwo) =
draw zone--ztwo;
draw (zone shifted (0,-2))--(zone shifted (0,2));
draw (ztwo shifted (0,-2))--(ztwo shifted (0,2));
enddef;

scalefactor(z3, z4);
scalefactor(z6, z7);

label.top(btex $a(t_0) = a$ etex, z5);
label.top(btex $a(t_1) = 1.5a$ etex, z8);

endfig;

%
% Ausdehnung des Universums und einzelne Terme
%
beginfig(2)

numeric u, v;
u := 15;
v := 10;

z0 = (0,0);
z1 = (20 * u, 0);
z2 = (0, 24.2 * v);

pickup pencircle scaled 1pt;
drawarrow (z0 shifted (-10,0))--(z1 shifted (10,0));
drawarrow (z0 shifted (0,-10))--(z2 shifted (0,10));

for x = 1 step 1 until 20:
	draw (x * u, -2)--(x * u, 2);
endfor;
for y = 1 step 1 until 24:
	draw (-2, y * v)--(2, y * v);
endfor;

label.top(btex $t$ etex, z1 shifted (10,0));
label.lft(btex $a$ etex, z2 shifted (0,10));

input universe.mp;

draw p dashed evenly;

pickup pencircle scaled 2pt;
draw (p cutafter (point 100 of p)) withcolor red;
draw ((p cutbefore (point 200 of p)) cutafter (point 600 of p)) withcolor green;
draw (p cutbefore (point 1400 of p)) withcolor blue;

pickup pencircle scaled 0.5pt;

z3 = point 50 of p;
z4 = (3 * u, 1 * v);
draw z3--z4 withcolor red;
label.rt(btex $\rho$-Term dominiert: Wachstum mit Potenzgesetz etex, z4);

z5 = point 400 of p;
z6 = (6 * u, 4 * v);
draw z5--z6 withcolor green;
label.rt(btex $\kappa$-Term dominiert: lineares Wachstum etex, z6);

z7 = (point 1700 of p);
z8 = (15 * u, 21 * v);
draw z7--z8 withcolor blue;
label.lft(btex $\Lambda$-Term dominiert: exponentielles Wachstum etex, z8);

endfig;

%
% Strahlungsdominiertes und Materiedominiertes Universum
%
beginfig(3)

numeric u, v;
u := 150;
v := 100;

z0 = (0,0);
z1 = (1.5 * u, 0);
z2 = (0, 2 * v);

pickup pencircle scaled 1pt;

drawarrow (z0 shifted (-10,0))--(z1 shifted (10,0));
drawarrow (z0 shifted (0,-10))--(z2 shifted (0,10));

for x = 0.5 step 0.5 until 1.6:
	draw (x * u, -2)--(x * u, 2);
endfor;
label.bot(btex $0.5$ etex, (0.5 * u, -2));
label.bot(btex $1.0$ etex, (1.0 * u, -2));
label.bot(btex $1.5$ etex, (1.5 * u, -2));
for y = 0.2 step 0.2 until 2.1:
	draw (-2, y * v)--(2, y * v);
endfor;
label.lft(btex $0.2$ etex, (-2, 0.2 * v));
label.lft(btex $0.4$ etex, (-2, 0.4 * v));
label.lft(btex $0.6$ etex, (-2, 0.6 * v));
label.lft(btex $0.8$ etex, (-2, 0.8 * v));
label.lft(btex $1.0$ etex, (-2, 1.0 * v));
label.lft(btex $1.2$ etex, (-2, 1.2 * v));
label.lft(btex $1.4$ etex, (-2, 1.4 * v));
label.lft(btex $1.6$ etex, (-2, 1.6 * v));
label.lft(btex $1.8$ etex, (-2, 1.8 * v));
label.lft(btex $2.0$ etex, (-2, 2.0 * v));

label.top(btex $t$ etex, z1 shifted (10,0));
label.lft(btex  $a$ etex, z2 shifted (0,10));

%h1 = plot(t1, 3/2*t1.^(2/3), 'LineWidth', 4, 'color', 'b');
vardef blau(expr t) =
	(1.5 * mexp(mlog(t) * 2 / 3))
enddef;
vardef blaupunkt(expr t) =
	(t * u, blau(t) * v)
enddef;
%h2 = plot(t1, sqrt(2*t1), 'LineWidth', 4, 'color', 'g');
vardef gruen(expr t) =
	sqrt(2 * t)
enddef;
vardef gruenpunkt(expr t) =
	(t * u, gruen(t) * v)
enddef;
path p, q;
p := (0,0);
q := (0,0);
for t = 0.005 step 0.01 until 1.5:
	p := p--blaupunkt(t);
	q := q--gruenpunkt(t);
endfor;
p := p--blaupunkt(1.5);
q := q--gruenpunkt(1.5);

pickup pencircle scaled 1.5pt;

draw p withcolor blue;
draw q withcolor green;

pickup pencircle scaled 0.5pt;
z3 = (1 * u, 1.8 * v);
label.lft(btex gew\"ohnliche Materie dominiert etex, z3);
z4 = blaupunkt(1.2);
draw z3--z4 withcolor blue;

z5 = (1.25 * u, v);
label.bot(btex Strahlung dominiert etex, z5);
z6 = gruenpunkt(1.25);
draw z5--z6 withcolor green;

endfig;

%
% Big Crunch Szenario
%

beginfig(4)

numeric u, v;
u := 60;
v := 30;

z0 = (0,0);
z1 = (5 * u, 0);
z2 = (0, 5 * v);

path boundary;
boundary := z0--z1--(z1 shifted z2)--z2--cycle;

input "szenarios.mp";

pickup pencircle scaled 1pt;

draw apos withcolor red;
draw azero withcolor green;;
draw aneg withcolor blue;

clip currentpicture to boundary;

drawarrow (z0 shifted (-10,0))--(z1 shifted (10,0));
drawarrow (z0 shifted (0,-10))--(z2 shifted (0,10));
label.lft(btex $a$ etex, z2 shifted (0,10));
label.top(btex $t$ etex, z1 shifted (10,0));

draw (1 * u, -2)--(1 * u, 2);
label.bot(btex $1$ etex, (1 * u, -2));

draw (2 * u, -2)--(2 * u, 2);
label.bot(btex $2$ etex, (2 * u, -2));

draw (3 * u, -2)--(3 * u, 2);
label.bot(btex $3$ etex, (3 * u, -2));

draw (4 * u, -2)--(4 * u, 2);
label.bot(btex $4$ etex, (4 * u, -2));

draw (5 * u, -2)--(5 * u, 2);
label.bot(btex $5$ etex, (5 * u, -2));

draw (-2, 2 * v)--(2, 2 * v);
label.lft(btex $2$ etex, (-2, 2 * v));
draw (-2, 4 * v)--(2, 4 * v);
label.lft(btex $4$ etex, (-2, 4 * v));

label.ulft(btex $E > 0$ etex, point 230 of apos) withcolor red;
label.lrt(btex $E=0$ (Fluchtgeschwindigkeit) etex, point 280 of azero) withcolor green;
label.urt(btex $E < 0$ etex, point 175 of aneg) withcolor blue;

endfig;

%
% Illustration Gravitation Energieerhaltung
%
beginfig(5)

z0 = (0,0);

pickup pencircle scaled 0.7pt;
numeric r;
r := 80;
path kreis;
kreis := z0 shifted (r,0);
for a = 1 step 1 until 359:
	kreis := kreis--(r * (cosd(a), sind(a)));
endfor;
kreis := kreis--cycle;

draw kreis dashed evenly withcolor red;

z2 = r * (cosd(78.5), sind(78.5));
draw z0--z2 withcolor red;
label.lft(btex $D$ etex, 0.5[z0,z2]) withcolor red;

pickup pencircle scaled 10pt;
draw z0 withcolor green;
label.llft(btex $M$ etex, z0 shifted (-5,-5)) withcolor green;

numeric b;
b := 40;

z1 = (cosd(b), sind(b));
z3 = z1 scaled r;
z4 = z1 scaled (0.6 * r);

pickup pencircle scaled 1pt;
drawarrow z3--z4;

z5 = (cosd(b), sind(b));
z6 = z3 shifted (z5 scaled (0.4 * r));

pickup pencircle scaled 1pt;
drawarrow z3--z6 withcolor blue;
label.ulft(btex $v$ etex, z6) withcolor blue;

pickup pencircle scaled 4pt;
draw (z1 scaled r) withcolor blue;
label.rt(btex $m$ etex, (z1 scaled r) shifted (2,0)) withcolor blue;

label.lrt(btex $F_G$ etex, 0.8[z3,z4]);

endfig;

%
% Big Crunch für verschiedene Werte von E
%
beginfig(6)

numeric u, v;
u := 15;
v := 100;

input "bigcrunch.mp";

pickup pencircle scaled 1pt;

color gruen;
gruen = (0,0.8,0);

draw ahalf withcolor gruen;
draw aone withcolor (0.8,1,0.8);
draw atwo withcolor (0.8,1,0.8);

z0 = (0,0);
z1 = (9 * u, 0);
z2 = (0, 2 * v);

z10 = (-150, 0);
z11 = ( -50, 0);
z12 = z10 shifted z2;

z21 = z1 shifted (30,0);
z20 = z21 shifted (100,0);
z22 = z20 shifted z2;

fill (-28,-5)--(-8,-5)--(-8, 2*v + 10)--(-28, 2*v + 10)--cycle withcolor 0.95;
fill (z21 shifted (-27,-5))--(z21 shifted (-6,-5))--(z21 shifted (-7, 2*v + 10))--(z21 shifted (-27, 2*v + 10))--cycle withcolor 0.95;

drawarrow (z0 shifted (-5, 0))--(z1 shifted (5,0));
drawarrow (z0 shifted (0,-5))--(z2 shifted (0,5));
label.rt(btex $a$ etex, z2 shifted (0,5));
label.top(btex $t$ etex, z1 shifted (5,0));

drawarrow (z10 shifted (-5, 0))--(z11 shifted (5,0));
drawarrow (z10 shifted (0,-5))--(z12 shifted (0,5));
label.rt(btex $a$ etex, z12 shifted (0,5));
label.top(btex $f(a)$ etex, z11 shifted (10,0));

pickup pencircle scaled 0.4pt;

draw (z10 shifted (0, 2 * v))--(z20 shifted (0, 2 * v));
draw (z10 shifted (0, 1 * v))--(z20 shifted (0, 1 * v));
draw (z10 shifted (0, 0.5 * v))--(z20 shifted (0, 0.5 * v));
label.top(btex $E=-2$ etex, (0.3[z21,z20]) shifted (0, 0.5 * v));
label.top(btex $E=-1$ etex, (0.3[z21,z20]) shifted (0, 1 * v));
label.top(btex $E=-\frac12$ etex, (0.3[z21,z20]) shifted (0, 2 * v));

pickup pencircle scaled 1pt;

numeric flimit;
flimit := 3;

def f(expr a, E) =
	sqrt(1/a - E)
enddef;

def fpoint(expr a, E) =
	((100 * f(a, E) / flimit, a * v) shifted z10)
enddef;

path p;
def fcurve(expr E) =
	p := fpoint(1/E, E);
	numeric amin;
	amin := 1/(flimit * flimit + E);
	numeric da;
	da := 0.01;
	for a = 1/E - da step -da until amin:
		p := p--fpoint(a, E);
	endfor;
	p := p--fpoint(amin, E);
enddef;
fcurve(2);
draw p withcolor (1,0.8,0.8);
fcurve(1);
draw p withcolor (1,0.8,0.8);
fcurve(0.5);
draw p withcolor red;

def g(expr a, E) =
	-f(a, E)
enddef;

def gpoint(expr a, E) =
	((100 * g(a, E) / flimit, a * v) shifted z20)
enddef;

def gcurve(expr E) =
	p := gpoint(1/E, E);
	numeric amin;
	amin := 1 / (flimit * flimit + E);
	numeric da;
	da := 0.01;
	for a = 1/E - da step -da until amin:
		p := p--gpoint(a, E);
	endfor;
	p := p--gpoint(amin, E);
enddef;
gcurve(2);
draw p withcolor (0.8,0.8,1);
gcurve(1);
draw p withcolor (0.8,0.8,1);
gcurve(0.5);
draw p withcolor blue;

drawarrow (z20 shifted (0,-5))--(z22 shifted (0,5));
drawarrow (z21 shifted (-5,0))--(z20 shifted (10,0));
label.lft(btex $a$ etex, z22 shifted (0,5));
label.top(btex $f(a)$ etex, z20 shifted (10,0));

numeric a;
for i = 0 step 1 until 7:
	a := 0.15 + i * 0.25;
	draw (z10 shifted (0,a * v))--fpoint(a,0.5) withcolor red;
	%drawarrow (-25 + 2 * i,a * v)--(-25 + 2 * i,a * v + 100 * f(a, 0.5) / flimit)
	drawarrow
		(-25 + 2 * i,a * v - 50 * f(a, 0.5) / flimit)
		--
		(-25 + 2 * i,a * v + 50 * f(a, 0.5) / flimit)
		withcolor red;
	draw (z20 shifted (0,a * v))--gpoint(a,0.5) withcolor blue;
	drawarrow 
		((-10 - 2 * i,a * v + 50 * f(a, 0.5) / flimit)
		--
		(-10 - 2 * i,a * v - 50 * f(a, 0.5) / flimit)
		) shifted z21 withcolor blue;
endfor;

endfig;

end



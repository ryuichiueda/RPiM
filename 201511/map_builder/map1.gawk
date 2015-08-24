#!/usr/local/bin/gawk -f

BEGIN		{ x = 720; y = 90; t = 180 }
$1=="forward"	{ x += $2*cos(t*3.1415/180); y += $2*sin(t*3.1415/180) }
$1=="turn"	{ t += $2 }

/^[ft]/{print x,y,t}

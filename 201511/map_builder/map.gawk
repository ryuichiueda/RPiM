#!/usr/local/bin/gawk -f 

function distance(v){
	if(v < 500)	return -1;
	if(v < 1000)	return 200 - v/10;
	if(v < 3000)	return 125 - v/40;
	return 50;
}

function wall_x(d,sx,sy,st){
	df = t * 3.1415 / 180
	return x + sy*cos(df) + sx*sin(df) + d*cos(df + st*3.1415/180)
}

function wall_y(d,sx,sy,st){
	df = t * 3.1415 / 180
	return y + sy*sin(df) - sx*cos(df) + d*sin(df + st*3.1415/180)
}

BEGIN		{ x = 720; y = 90; t = 180 }
$1=="forward"	{ x += $2*cos(t*3.1415/180); y += $2*sin(t*3.1415/180) }
$1=="turn"	{ t += $2 }

/^[0-9]/	{
	lf = distance($4); ls = distance($3)
	rs = distance($2); rf = distance($1)

	#左前方
	if(lf > 0){
		wx = wall_x(lf,-45,40,0)
		wy = wall_y(lf,-45,40,0)
		image[int(wx/3),int(wy/3)] = 1
	}
	#左横
	if(ls > 0){
		wx = wall_x(ls,-15,60,55)
		wy = wall_y(ls,-15,60,55)
		image[int(wx/3),int(wy/3)] = 1
	}
	#右横
	if(rs > 0){
		wx = wall_x(rs,15,60,-55)
		wy = wall_y(rs,15,60,-55)
		image[int(wx/3),int(wy/3)] = 1
	}
	#右前方
	if(rf > 0){
		wx = wall_x(rf,45,40,0)
		wy = wall_y(rf,45,40,0)
		image[int(wx/3),int(wy/3)] = 1
	}
}

END{ #画像の出力
	print "P2",300,300,255
	for(iy=299;iy>=0;iy--){
		for(ix=0;ix<300;ix++){
			print image[ix,iy]==1?0:255
		}
	}
}

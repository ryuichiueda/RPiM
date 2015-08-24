#!/usr/local/bin/gawk -f 

function rec(){ n++; xhis[n] = x; yhis[n] = y ; this[n] = t }

BEGIN		{ x = 900 - 180; y = 90; t = 180; rec() }
$1=="forward"	{ x += $2*cos(t*3.1415/180); y += $2*sin(t*3.1415/180); rec() }
$1=="turn"	{ t += $2; rec() }

END{
	#各位置を線で結ぶ
	for(i=1;i<length(xhis);i++){
		for(t=0;t<1;t+=0.1){
			x = xhis[i] + t*(xhis[i+1] - xhis[i])
			y = yhis[i] + t*(yhis[i+1] - yhis[i])
			image[int(x/3),int(y/3)] = 1
		}
	}

	#出力
	print "P2",300,300,255
	for(iy=299;iy>=0;iy--){
		for(ix=0;ix<300;ix++){
			print image[ix,iy]==1?0:255
		}
	}
}


array as[3]
array bs[3]
array cs[3]
array Q[3]

as[1]=2.0*pi/(a_lat*cos(pi/6.0))
as[2]=0.0
as[3]=0.0

bs[1]=2.0*pi/(a_lat*cos(pi/6.0))/2.0
bs[2]=2.0*pi/(a_lat*cos(pi/6.0))/2.0*sqrt(3.0)
bs[3]=0.0

cs[1]=0.0
cs[2]=0.0
cs[3]=2.0*pi/(c_lat)

unset title
unset xlabel
unset ylabel
set  ytics auto
set  xtics auto

set term png
set auto y
set size ratio 0.6  # ratio r = height/width

set xlabel '2theta (deg)'
set ylabel label_Int

set print "fit_results.txt" 
print  "#H K L d(A) BG BG_err A A_err tth tth_err HWHM HWHM_err"

F(x)=BG+A*exp(-log(2.0)*(x-tth)**2.0/HWHM**2.0)
F2(x)=F(x)+A2*exp(-log(2.0)*(x-tth2)**2.0/HWHM2**2.0)

HWHM=0.2
BG=50.0


########################## 10-2 reflection ###########
A=0.12*StrongestPeak
H=1.0
K=0.0
L=-2.0
do for [i=1:3]{
    Q[i]=H*as[i]+K*bs[i]+L*cs[i]
}
d=abs(2.0*pi/sqrt(Q[1]**2.0+Q[2]**2.0+Q[3]**2.0))
tth=asin(Lambda/(2.0*d))*2.0/pi*180
fit [tth-tth_range:tth+tth_range] F(x) datafile1 using (abs($2)):5:(sqrt($5)) yerror via BG,A,tth,HWHM
print  H,K,L,d,BG,BG_err,A,A_err,tth,tth_err,HWHM,HWHM_err
set term png
set out "Peak_10-2.png"
set title calib_title."\n10-2 reflection"
set xrange[tth-tth_range:tth+tth_range]
plot datafile1 using (abs($2)):5:(sqrt($5)) w yer t 'obs',F(x) t 'fit'

########################## 10-4 reflection ###########
A=0.12*StrongestPeak
H=1.0
K=0.0
L=4.0
do for [i=1:3]{
    Q[i]=H*as[i]+K*bs[i]+L*cs[i]
}
d=abs(2.0*pi/sqrt(Q[1]**2.0+Q[2]**2.0+Q[3]**2.0))
tth=asin(Lambda/(2.0*d))*2.0/pi*180
fit [tth-tth_range:tth+tth_range] F(x) datafile1 using (abs($2)):5:(sqrt($5)) yerror via BG,A,tth,HWHM
print  H,K,L,d,BG,BG_err,A,A_err,tth,tth_err,HWHM,HWHM_err
set out "Peak_104.png"
set title calib_title."\n104 reflection"
set xrange[tth-tth_range:tth+tth_range]
plot datafile1 using (abs($2)):5:(sqrt($5)) w yer t 'obs',F(x) t 'fit'

########################## 2-10 reflection ########### very weak!!
#A=0.02*StrongestPeak
#tth=61.6
#fit [tth-tth_range:tth+tth_range] F(x) datafile1 using (abs($2)):5:(sqrt($5)) yerror via BG,A,tth,HWHM
#print  2,-1,0,2.377285,BG,BG_err,A,A_err,tth,tth_err,HWHM,HWHM_err
#set out "Peak_2-10.png"
#set xrange[tth-tth_range:tth+tth_range]
#plot datafile1 using (abs($2)):5:(sqrt($5)) w yer t 'obs',F(x) t 'fit'

########################## 006 and 2-13 reflections ###########
A=0.3*StrongestPeak
H=0.0
K=0.0
L=6.0
do for [i=1:3]{
    Q[i]=H*as[i]+K*bs[i]+L*cs[i]
}
d=abs(2.0*pi/sqrt(Q[1]**2.0+Q[2]**2.0+Q[3]**2.0))
tth=asin(Lambda/(2.0*d))*2.0/pi*180

A2=1.0*StrongestPeak
H2=2.0
K2=-1.0
L2=3.0
do for [i=1:3]{
    Q[i]=H2*as[i]+K2*bs[i]+L2*cs[i]
}
d2=abs(2.0*pi/sqrt(Q[1]**2.0+Q[2]**2.0+Q[3]**2.0))
tth2=asin(Lambda/(2.0*d2))*2.0/pi*180
fit [tth-tth_range:tth2+tth_range] F2(x) datafile1 using (abs($2)):5:(sqrt($5)) yerror via BG,A,tth,HWHM,A2,tth2,HWHM2
print  H,K,L,d,BG,BG_err,A,A_err,tth,tth_err,HWHM,HWHM_err
print  H2,K2,L2,d2,BG,BG_err,A2,A2_err,tth2,tth2_err,HWHM2,HWHM2_err
set out "Peak_006_213.png"
set title calib_title."\n006 and 213 reflections"
set xrange[tth-tth_range:tth2+tth_range]
plot datafile1 using (abs($2)):5:(sqrt($5)) w yer t 'obs',F2(x) t 'fit'

########################## 20-4 reflection ###########
A=0.12*StrongestPeak
H=2.0
K=0.0
L=-4.0
do for [i=1:3]{
    Q[i]=H*as[i]+K*bs[i]+L*cs[i]
}
d=abs(2.0*pi/sqrt(Q[1]**2.0+Q[2]**2.0+Q[3]**2.0))
tth=asin(Lambda/(2.0*d))*2.0/pi*180
fit [tth-tth_range:tth+tth_range] F(x) datafile1 using (abs($2)):5:(sqrt($5)) yerror via BG,A,tth,HWHM
print  H,K,L,d,BG,BG_err,A,A_err,tth,tth_err,HWHM,HWHM_err
set out "Peak_20-4.png"
set title calib_title."\n20-4 reflection"
set xrange[tth-tth_range:tth+tth_range]
plot datafile1 using (abs($2)):5:(sqrt($5)) w yer t 'obs',F(x) t 'fit'

########################## 2-16 reflection ###########
A=0.46*StrongestPeak
H=2.0
K=-1.0
L=6.0
do for [i=1:3]{
    Q[i]=H*as[i]+K*bs[i]+L*cs[i]
}
d=abs(2.0*pi/sqrt(Q[1]**2.0+Q[2]**2.0+Q[3]**2.0))
tth=asin(Lambda/(2.0*d))*2.0/pi*180
fit [tth-tth_range:tth+tth_range] F(x) datafile1 using (abs($2)):5:(sqrt($5)) yerror via BG,A,tth,HWHM
print  H,K,L,d,BG,BG_err,A,A_err,tth,tth_err,HWHM,HWHM_err
set out "Peak_2-16.png"
set title calib_title."\n2-16 reflection"
set xrange[tth-tth_range:tth+tth_range]
plot datafile1 using (abs($2)):5:(sqrt($5)) w yer t 'obs',F(x) t 'fit'

########################## 3-11 reflection ###########
#A=0.06*StrongestPeak
#tth=104.10
#H=3.0
#K=-1.0
#L=1.0
#do for [i=1:3]{
#    Q[i]=H*as[i]+K*bs[i]+L*cs[i]
#}
#d=abs(2.0*pi/sqrt(Q[1]**2.0+Q[2]**2.0+Q[3]**2.0))
#fit [tth-tth_range:tth+tth_range] F(x) datafile1 using (abs($2)):5:(sqrt($5)) yerror via BG,A,tth,HWHM
#print  H,K,L,d,BG,BG_err,A,A_err,tth,tth_err,HWHM,HWHM_err
#set out "Peak_3-11.png"
#set title calib_title."\n3-11 reflection"
#set xrange[tth-tth_range:tth+tth_range]
#plot datafile1 using (abs($2)):5:(sqrt($5)) w yer t 'obs',F(x) t 'fit'


set print "-"
set out
set term X
set auto x
set auto y
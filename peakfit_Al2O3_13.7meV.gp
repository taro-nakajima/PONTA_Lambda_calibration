#datafile1='PONTA_exp0003_scan0021.dat'

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

F(x)=BG+A*exp(-log(2)*(x-tth)**2.0/HWHM**2.0)

tth_range=1.5
HWHM=0.2
BG=50.0

A=0.12*StrongestPeak
tth=41.0
fit [tth-tth_range:tth+tth_range] F(x) datafile1 using (abs($2)):5:(sqrt($5)) yerror via BG,A,tth,HWHM
print  1,0,-2,3.480811,BG,BG_err,A,A_err,tth,tth_err,HWHM,HWHM_err
set term png
set out "A2_-41.0_10-2.png"
set title calib_title."\n10-2 reflection"
set xrange[tth-tth_range:tth+tth_range]
plot datafile1 using (abs($2)):5:(sqrt($5)) w yer t 'obs',F(x) t 'fit'

A=0.12*StrongestPeak
tth=57.0
fit [tth-tth_range:tth+tth_range] F(x) datafile1 using (abs($2)):5:(sqrt($5)) yerror via BG,A,tth,HWHM
print  1,0,4,2.551433,BG,BG_err,A,A_err,tth,tth_err,HWHM,HWHM_err
set out "A2_-57.1_104.png"
set title calib_title."\n104 reflection"
set xrange[tth-tth_range:tth+tth_range]
plot datafile1 using (abs($2)):5:(sqrt($5)) w yer t 'obs',F(x) t 'fit'

#A=0.02*StrongestPeak
#tth=61.6
#fit [tth-tth_range:tth+tth_range] F(x) datafile1 using (abs($2)):5:(sqrt($5)) yerror via BG,A,tth,HWHM
#print  2,-1,0,2.380100,BG,BG_err,A,A_err,tth,tth_err,HWHM,HWHM_err
#set out "A2_-61.6_2-10.png"
#set xrange[tth-tth_range:tth+tth_range]
#plot datafile1 using (abs($2)):5:(sqrt($5)) w yer t 'obs',F(x) t 'fit'

A=0.3*StrongestPeak
A=2000.0
tth=68.50
HWHM=0.2
fit [tth-tth_range:tth+tth_range] F(x) datafile1 using (abs($2)):5:(sqrt($5)) yerror via BG,A,tth,HWHM
print  0,0,6,2.165550,BG,BG_err,A,A_err,tth,tth_err,HWHM,HWHM_err
set out "A2_-68.6_006.png"
set title calib_title."\n006 reflection"
set xrange[tth-tth_range:tth+tth_range]
plot datafile1 using (abs($2)):5:(sqrt($5)) w yer t 'obs',F(x) t 'fit'

A=1.0*StrongestPeak
tth=71.60
fit [tth-tth_range:tth+tth_range] F(x) datafile1 using (abs($2)):5:(sqrt($5)) yerror via BG,A,tth,HWHM
print  2,-1,3,2.085889,BG,BG_err,A,A_err,tth,tth_err,HWHM,HWHM_err
set out "A2_-71.6_213.png"
set title calib_title."\n213 reflection"
set xrange[tth-tth_range:tth+tth_range]
plot datafile1 using (abs($2)):5:(sqrt($5)) w yer t 'obs',F(x) t 'fit'

A=0.12*StrongestPeak
tth=89.00
fit [tth-tth_range:tth+tth_range] F(x) datafile1 using (abs($2)):5:(sqrt($5)) yerror via BG,A,tth,HWHM
print  2,0,-4,1.740406,BG,BG_err,A,A_err,tth,tth_err,HWHM,HWHM_err
set out "A2_-89.0_20-4.png"
set title calib_title."\n20-4 reflection"
set xrange[tth-tth_range:tth+tth_range]
plot datafile1 using (abs($2)):5:(sqrt($5)) w yer t 'obs',F(x) t 'fit'

A=0.46*StrongestPeak
tth=99.20
fit [tth-tth_range:tth+tth_range] F(x) datafile1 using (abs($2)):5:(sqrt($5)) yerror via BG,A,tth,HWHM
print  2,-1,6,1.601767,BG,BG_err,A,A_err,tth,tth_err,HWHM,HWHM_err
set out "A2_-99.2_2-16.png"
set title calib_title."\n2-16 reflection"
set xrange[tth-tth_range:tth+tth_range]
plot datafile1 using (abs($2)):5:(sqrt($5)) w yer t 'obs',F(x) t 'fit'

A=0.06*StrongestPeak
tth=104.10
fit [tth-tth_range:tth+tth_range] F(x) datafile1 using (abs($2)):5:(sqrt($5)) yerror via BG,A,tth,HWHM
print  3,-1,1,1.547057,BG,BG_err,A,A_err,tth,tth_err,HWHM,HWHM_err
set out "A2_-104.1_3-11.png"
set title calib_title."\n3-11 reflection"
set xrange[tth-tth_range:tth+tth_range]
plot datafile1 using (abs($2)):5:(sqrt($5)) w yer t 'obs',F(x) t 'fit'


set print "-"
set out
set term X
set auto x
set auto y
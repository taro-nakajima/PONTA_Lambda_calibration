ki=2.0*pi/Lambda
deg2rad=pi/180.0

# check data number
stats 'fit_results.txt' using 1 nooutput
N = STATS_records   # number of raws 

array H[N]
array K[N]
array L[N]
array d[N]
array TTH[N]
array TTH_err[N]
array HWHM[N]
array HWHM_err[N]

# read data from file
stats 'fit_results.txt' using (H[$0+1] = $1, K[$0+1] = $2,L[$0+1] = $3,d[$0+1] = $4,TTH[$0+1] = $9,TTH_err[$0+1] = $10,HWHM[$0+1] = $11,HWHM_err[$0+1] = $12, 0) nooutput

set print "resolution.txt" 
print "#H K L d(A) Q(A-1) W_FWHM(A-1) W_FWHM_err(A-1)"

do for [i=1:N]{
    Wr_FWHM=2.0*ki*cos((TTH[i]-tth_ofst)*deg2rad/2.0)*(HWHM[i]*deg2rad)
    dWr_FWHM=2.0*ki*(sin((TTH[i]-tth_ofst)*deg2rad/2.0)/2.0*(HWHM[i]*deg2rad)+cos((TTH[i]-tth_ofst)*deg2rad/2.0))*HWHM_err[i]*deg2rad
    print H[i], K[i], L[i], d[i], 2.0*pi/d[i], Wr_FWHM, dWr_FWHM
    }

set yrange[0:]
set xrange[0:]

set term postscript eps enhanced color "Helvetica" 18
set out 'Resolution.ps'

set style line 1 lt 1 lc "#ff0000" lw 2 pt 7 ps 1.5
set style line 11 lt 1 lc "#000000" lw 2 pt 65 ps 1.5

set size ratio 0.6  # ratio r = height/width

set encoding iso_8859_1

set title calib_title."\n {/Symbol l}=".sprintf("%6.4f",Lambda)." {/Helvetica \305}, 2{/Symbol q}_{ofst}=".sprintf("%6.4f",tth_ofst)." deg." 

set xlabel 'Q ({/Helvetica \305}^{-1})' font "Helvetica,22"
set ylabel 'FWHM ({/Helvetica \305}^{-1})' font "Helvetica,22"

plot "resolution.txt" u 5:6:7 w yer ls 1 not,"resolution.txt" u 5:6 w p ls 11 not

set term X
set auto x
set auto y
set out


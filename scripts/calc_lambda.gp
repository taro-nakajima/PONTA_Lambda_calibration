
set term postscript eps enhanced color "Helvetica" 18
set out '2theta_offset.ps'

set style line 1 lt 1 lc "#ff0000" lw 2 pt 7 ps 1.5
set style line 11 lt 1 lc "#000000" lw 2 pt 65 ps 1.5

set size ratio 0.6  # ratio r = height/width

set auto x
set auto y

TTH_cal(x) = 2.0*asin(Lambda/2.0/x)/pi*180.0 + tth_ofst

fit TTH_cal(x) "fit_results.txt" u 4:9:10 yerror via Lambda,tth_ofst

set encoding iso_8859_1

set title calib_title."\n {/Symbol l}=".sprintf("%6.4f",Lambda)." {/Helvetica \305}, 2{/Symbol q}_{ofst}=".sprintf("%6.4f",tth_ofst)." deg." 

set xlabel 'd ({/Helvetica \305})' font "Helvetica,22"
set ylabel '2{/Symbol q}_{obs} - 2{/Symbol q}_{cal} (deg)' font "Helvetica,22"

plot "fit_results.txt" u 4:($9-TTH_cal($4)):10 w yer ls 1 not,

set term X
set auto x
set out


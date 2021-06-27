#datafile1='PONTA_exp0003_scan0021.dat'

set term postscript eps enhanced color "Helvetica" 18
set out 'Profile.ps'

set style line 1 lt 1 lc "#ff0000" lw 2 pt 1 ps 1
set style line 11 lt 1 lc "#000080" lw 1 pt 65 ps 1.5

set size ratio 0.4  # ratio r = height/width

set title calib_title

set xlabel '2{/Symbol q} (deg)' font "Helvetica,22"
set ylabel label_Int font "Helvetica,22"

set yrange[-StrongestPeak*0.1:]

set xtics auto
set xtics auto

plot datafile1 u (abs($2)):5 w l ls 11 not,datafile1 u (abs($2)):5 w p ls 1 not



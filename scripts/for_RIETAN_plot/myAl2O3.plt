# LPS = 0: Plot no axis for lattice-plane spacings
# LPS = 1: Plot an axis for lattice-plane spacings
LPS = 0

label_Int = "Intensity (counts/30 s)"


 WIDTH = 24.5 # Width/cm of the graph
HEIGHT =  8.0 # Height/cm of the graph

XMIN =  35.0 # Minimum value for the x axis
XMAX = 110.0 # Maximum value for the x axis

YMIN = -3000 # Minimum value for the y axis
YMAX =  7000 # Maximum value for the y axis
YINC =  1000 # Increment for ticks on the y axis

IVSIZE = 12  # Size of numerical values for the x and y axes
ILSIZE = 14  # Size of labels for the x and y axes
 SYLBL = -1.5 # Shift of the y label (Intensity) along the x axis in the unit of a character

PSIZE = 0.35 # Size of '+' marks representing observed intensities
TSIZE = 0.90 # Length (in percent of the y-axis length) of tick marks to show peak positions

OFFSETD = -1500 # Offset for the residual curve

OFFSET1 =  -400 # Offset for tick marks (peak positions) for phase No. 1

DLW = 1.1 # Default linewidth
BLW = 1.1 # Linewidth of graph borders

set border linewidth BLW
set tics scale 1.7, 0.9

LEN_BAR = 0.01*TSIZE*(YMAX-YMIN)
set bars 0

#set terminal pdfcairo linewidth DLW size WIDTH/2.54, HEIGHT/2.54 fontscale 0.75
#set terminal postscript eps enhanced color linewidth DLW size WIDTH/2.54, HEIGHT/2.54 "Helvetica" 8
#set term postscript eps enhanced color "Helvetica" 12
set term png font "Arial,10" size 1600,400 crop
set out "profile.png"

set size ratio 0.3
set size 1.2,1

ITSIZE = ILSIZE + 2
set title "PONTA lambda calibration by Al2O3 powder" font ",".ITSIZE

#set label 1 at graph 0.8500, 0.92 "{/:Italic R}_{wp} = 42.19 %" font ", 17"
#set label 2 at graph 0.8622, 0.84 "{/:Italic R}_p = 32.99 %" font ", 17"
#set label 3 at graph 0.8608, 0.76 "{/:Italice R}_B = 28.77 %" font ", 17"
#set label 4 at graph 0.8577, 0.68 "{/:Italic R_F}&{/=30 |}= 17.84 %" font ", 17"

set ytics mirror offset 0.4, 0.22 font ",".IVSIZE 0, YINC
#set mytics 2 # The number of sub-intervals between major tics
set ylabel label_Int offset SYLBL, 0 font ",".ILSIZE

set mxtics 5 # The number of sub-intervals between major tics
#set xlabel "2{/:Italic \316\270}&{/=15 |}/&{/=15 |}\302\260" offset 0, -0.1 font ",".ILSIZE
set xlabel '2theta (deg)' font ",".ILSIZE

if ( LPS == 0 ) {
  set xtics mirror offset -0.22, 0.3 10 font ",".IVSIZE # increment = 10
} else {
  set xtics nomirror offset -0.22, 0.3 10 font ",".IVSIZE # increment = 10

  lambda = 2.445377
  set angles degrees
  set x2tics offset -0.31, 0.1 autofreq font ",".IVSIZE
  set link x2 via 0.5*lambda/sin(0.5*x) inverse 2.0*asin(0.5*lambda/x)
  set mx2tics 10 # The number of sub-intervals between major tics
  set x2label "{/:Italic d}&{/=14 |}/&{/=10 |}\303\205" offset 0, -0.4 font ",".ILSIZE
}

# Margins measured in character widths or heights (a negative value: automatic)
set margins 15, 5, 4, -1 # <left>, <right>, <bottom>, <top>

plot [XMIN:XMAX] [YMIN:YMAX] "Al2O3.gpd" \
   every :::0::0 using 1:($3) notitle with lines linetype 11 linecolor rgbcolor "cyan", \
'' every :::0::0 using 1:2 notitle with points pointtype 1 pointsize PSIZE linecolor rgbcolor "red", \
'' every :::0::0 using 1:($5) notitle with lines linetype 11 linecolor rgbcolor "black", \
'' every :::1::1 using 4:(OFFSET1):(LEN_BAR) notitle with yerrorbars linetype 4 pointtype 1 pointsize 0 linecolor rgbcolor "forest-green", \
'' every :::0::0 using 1:($4+OFFSETD) notitle with lines linetype 3 linecolor rgbcolor "blue"


## Determination of crystallite size and microstrain

# WIDTH = 23.0 # Width/cm of the graph
#HEIGHT = 16.0 # Height/cm of the graph

#XMIN = 0.0 # Minimum value for the x axis
#XMAX = 4.27257E-02 # Maximum value for the x axis

#YMIN = 0.0 # Minimum value'//for the y axis
#YMAX =  0.20512     # Maximum value for the y axis

#IVSIZE = 15 # Size of numerical values for the x and y axes
#ILSIZE = 17 # Size of labels for the x and y axes
# SYLBL = -2 # Shift of the y label along the x axis in a unit of a character

#PSIZE = 0.9 # Size of circles

#DLW = 1.1 # Default linewidth
#BLW = 1.1 # Linewidth of graph borders

#set terminal pdfcairo linewidth DLW size WIDTH/2.54, HEIGHT/2.54 fontscale 0.75
#set border linewidth BLW

#set tics scale 1.7, 0.9

#set xtics mirror offset -0.26, 0.2 autofreq font ",".IVSIZE
#set mxtics 5 # The number of sub-intervals between major tics
#set xlabel "{/:Italic \316\262}&{/=15 |}/&{/=10 |}(tan{/:Italic \316\270}&{/=15 |}sin{/:Italic \316\270}&{/=6 |})" offset 0, -0.1 font ",".ILSIZE

#set ytics mirror offset 0.3, 0.22 autofreq font ",".IVSIZE
#set mytics 5 # The number of sub-intervals between major tics
#set ylabel "1000&{/=6 |}({/:Italic \316\262}&{/=15 |}/&{/=15 |}tan{/:Italic \316\270}&{/=6 |})^2" offset SYLBL, 0 font ",".ILSIZE
#set format y '%.2f' # Number of decimals = 2; change '%.2f' if needed

## Margins measured in character widths or heights (a negative value: automatic)
#set margins -1, -1, 4, -1 # <left>, <right>, <bottom>, <top>

#set multiplot
#plot [XMIN:XMAX] [YMIN:YMAX] "Al2O3.gpd" every :::1::1 using ($9/$7**2):(1000*($9/$7)**2) notitle with points pointtype 6 pointsize PSIZE linecolor rgbcolor "black" linewidth 1.4*DLW

#plot [XMIN:XMAX] [YMIN:YMAX] '-' notitle with lines linewidth 1.5 linetype -1
#   0.00000      5.211427E-02
#  3.884153E-02  0.182767    
#e

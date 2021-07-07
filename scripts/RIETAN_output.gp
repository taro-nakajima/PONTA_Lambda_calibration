set print "calibration_results.txt" 

# check data number
stats datafile1 using 1 nooutput
N = STATS_records   # number of raws 

array TTH[N]
array Int[N]

# read data from file
stats datafile1 using (TTH[$0+1] = $2, Int[$0+1] = $5, 0) nooutput

set print "Al2O3.int" 
print "GENERAL"
print N

if(abs(TTH[1])-abs(TTH[2])>0){
    do for [i=1:N]{
        print abs(TTH[N-i]), Int[N-i]
    }
}
else{
    do for [i=1:N]{
        print abs(TTH[i]), Int[i]
    }
}

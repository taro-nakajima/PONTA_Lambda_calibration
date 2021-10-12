#gnuplot macro for Lmabda calibration using Al2O3 at 13.7 meV

calib_title = "Al_2O_3 polycrystal (12 Oct. 2021), collimation 40'-40'-40'-40'"

Mono_tau=1.87325   #Tau for PG(002)
#Mono_tau=1.8292   #Tau for Heusler

datafile1='PONTA_exp0023_scan0027.dat'
StrongestPeak = 6500.0
label_Int = "Intensity (counts/30 s)"

#Al2O3 lattice constants (updated on 7th Jul 2021)
a_lat=4.75439
c_lat=12.99080

#=== initial guesses of tth_ofst and Lambda ======
tth_ofst=0.2
#Lambda=2.444   #initial guess for 13.7 meV
Lambda=2.359   #initial guess for 14.7 meV
#Lambda=1.55   #initial guess for 34.05 meV
#=================================================

tth_range=1.5


load './scripts/plot_profile.gp'
load './scripts/peakfit_Al2O3.gp'
load './scripts/calc_lambda.gp'
load './scripts/resolution.gp'
load './scripts/RIETAN_output.gp'


set print "calibration_results.txt" 
print calib_title
print "Lambda = ",Lambda, "A"
print "Ei = ",2.072*(2.0*pi/Lambda)**2.0," meV"
print "2theta_ofst = ",tth_ofst," deg"
print ""
print "SPICE commands"
if(tth_ofst<0){
    print "Sample 2theta : se a2 (@(a2)".sprintf("%5.3f",tth_ofst).")"
}
else{
    print "Sample 2theta : se a2 (@(a2)+".sprintf("%5.3f",tth_ofst).")"
}
print "Monochro 2theta : se a1 ".sprintf("%5.3f",asin(Mono_tau/(4.0*pi/Lambda))/pi*180.0*2)
print "Monochro Omega : se c1 ".sprintf("%5.3f",asin(Mono_tau/(4.0*pi/Lambda))/pi*180.0)

set print "-"
set out
set term X

print ""
print "====== calibration results ======"
print calib_title
print "Lambda = ",Lambda," A"
print "Ei = ",2.072*(2.0*pi/Lambda)**2.0," meV"
print "2theta_ofst = ",tth_ofst," deg"
print ""
print "SPICE commands"
if(tth_ofst<0){
    print "Sample 2theta : se a2 (@(a2)".sprintf("%5.3f",tth_ofst).")"
}
else{
    print "Sample 2theta : se a2 (@(a2)+".sprintf("%5.3f",tth_ofst).")"
}
print "Monochro 2theta : se a1 ".sprintf("%5.3f",asin(Mono_tau/(4.0*pi/Lambda))/pi*180.0*2)
print "Monochro Omega : se c1 ".sprintf("%5.3f",asin(Mono_tau/(4.0*pi/Lambda))/pi*180.0)
print ""
print ""


set auto x
set auto y
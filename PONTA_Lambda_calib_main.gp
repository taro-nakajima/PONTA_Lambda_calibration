#gnuplot macro for Lmabda calibration using Al2O3 at 13.7 meV

calib_title = "Al_2O_3 polycrystal (26 Jun 2021), collimation 15'-40'-40'-40'"

Mono_tau=1.87325   #Tau for PG(002)
#Mono_tau=1.8292   #Tau for Heusler

datafile1='PONTA_exp0003_scan0021.dat'
StrongestPeak = 6500.0
label_Int = "Intensity (counts/30 s)"

#=== initial guesses of tth_ofst and Lambda ======
tth_ofst=0.2
Lambda=2.444
#=================================================

load 'plot_profile.gp'
load 'peakfit_Al2O3_13.7meV.gp'
load 'calc_lambda.gp'
load 'resolution.gp'


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
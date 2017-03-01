%Dirac delta function
function H=Dirac (t,tau,epsilon)
    if(t<(tau-epsilon)||t>(tau+epsilon))
        H=0;
    else
        H=1;
end
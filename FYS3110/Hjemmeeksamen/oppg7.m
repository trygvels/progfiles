N=1000;
g=4 %*10⁻10 eV
ae=1
am=5
at=6
t_=linspace(0,100,N);
H = [ae,g,g;g,am,g;g,g,at]; %Hamilton operator
[vecs, lambdas] =eig(H) %Finding Eigenvecs and Eigenvals

v_0 = [1;0;0];  %At t=0 the neutrino is an electron neutrino

coeff_mat = rref([vecs v_0]); %Calculating constants
e= [exp(-1j*lambdas(1,1)/(am-ae)*t_); exp(-1j*lambdas(2,2)/(am-ae)*t_); exp(-1j*lambdas(3,3)/(am-ae)*t_)]
c1 = coeff_mat(1,4);
c2 = coeff_mat(2,4);
c3 = coeff_mat(3,4);

num = zeros(N,1);
for j = 1:N
    num(j,1) =c1*e(1,j)*vecs(2,1) + c2*e(2,j)*vecs(2,2)+ c3*e(3,j)*vecs(2,3)
end


p=abs(num).^2 %Length of coefficients to muon state
plot(t_,p)
title('Probability of muon neutrino flavor as a function of time')
xlabel('Dimensionless time')
ylabel('Probability')
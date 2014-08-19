function coeff = halfderive_fourier_series(coeff, sw)

# for a half derivative we need to multiply with the square root of the frequency
# and a phase shift of pi/4, i.e. (1+1i)/sqrt(2)4
# sw should be an array of 1 and -1

N = size(coeff,1);
for i=1:N/2
	coeff(i) *= sqrt(i-1)*sw(i)*(1+1i)/sqrt(2);
end

# we're only using this for real valued data, so the rest of the spectrum
# is just the complex conjugated of the first part:
for i=N/2+1:N
	coeff(i) = conj(coeff(N-i+2));
end

end
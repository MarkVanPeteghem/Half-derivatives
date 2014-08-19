#{
This file demonstrates how to "derive a function one half times"
i.e. an operator on functions that gives the derivative if it is applied twice
to a function.
Here it is done on the Fourier series of a function, by multiplying the amplitude
with the square root of the frequency and
shifting the phase by pi/4 or 5*pi/4 (pi/2 for derivative).
It is well known that multiplying the amplitude with the frequency itself and
shifting the phase by pi/2 gives the derivative, so it is obvious that applying
that twice would give the derivative.
The fact that phase shifts of both pi/4 and 5*pi/4 can be used means there is
no unique solution.
#}

nr_coeffs = 1024;

# Construct Fourier series of a sawtooth function
sawtooth_coeffs = zeros(nr_coeffs);
for n=2:nr_coeffs/2
	sawtooth_coeffs(n) = nr_coeffs*1i/(n-1);
end
for n=nr_coeffs/2+1:nr_coeffs
	sawtooth_coeffs(n) = conj(sawtooth_coeffs(nr_coeffs-n+2));
end

# Construct Fourier series of a triangle function
triangle_coeffs = zeros(nr_coeffs);
for n=1:nr_coeffs/2
	if mod(n,2)==0
		triangle_coeffs(n) = -nr_coeffs*1i * (-1)**(n/2) / (n-1)**2;
	end
end
for n=nr_coeffs/2+1:nr_coeffs
	triangle_coeffs(n) = conj(triangle_coeffs(nr_coeffs-n+2));
end

x = zeros(nr_coeffs, 1);
for i=1:n
	x(i) = i;
end

# We construct different arrays to select a phase shift of pi/4 or 5*pi/4,
# 0 is pi/4, 1 is 5*pi/4.

sw_z = ones(length(triangle_coeffs), 1);
sw_3 = ones(length(triangle_coeffs), 1);
for i=1:length(sw_z)
	sw_3(i) = (-1)**mod(i,3);
end

sw_r = unifrnd(0,1, length(triangle_coeffs), 1);
sw_r = round(sw_r-0.45); # 0 or 1
sw_r = (-1).**sw_r; # -1 or 1
sw = sw_z;

# use either sawtooth_coeffs or triangle_coeffs in next line:
coeffs = triangle_coeffs;

func = ifft(coeffs);

half_derived_coeffs = halfderive_fourier_series(coeffs, sw);
derived_coeffs = halfderive_fourier_series(half_derived_coeffs, sw);
derived_one_and_half_coeffs = halfderive_fourier_series(derived_coeffs, sw);

half_derived = ifft(half_derived_coeffs);
derived = ifft(derived_coeffs);
derived_one_and_half = ifft(derived_one_and_half_coeffs);

plot(x, [func, half_derived, derived]);

#plot(x, real(triangle_coeffs));
#plot(x, triangle);
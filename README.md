Half-derivatives
================

Matlab files that demonstrate half derivatives.

A half derivative is something I came up with, after wondering if an operator can be found that applied twice to a function would give the derivative of the function, so look for an operator h for which

h(h(f(x))) = f(x)'

The question is then what do you get when you apply h once to a function.

I found two approaches to find such an operator. These both make use of the fact that the operator has to be linear.

Using Taylor series
-------------------

It is easy to see that 

h(x^n) = x^(n-1/2)*n!/(n-1/2)!

satisfies the requirements. If a function can be written as a Taylor series, this provides one way to define an operator h. It does not provide a unique way to do so, since functions can be written as a Taylor series around any value x0, and we have equally

h((x-x0)^n) = (x-x0)^(n-1/2)*n!/(n-1/2)!

Note that for real functions the half derivative has imaginary values for x < x0 and real values for x >= X0, which means that the half derivative is different for every value of x0.

Using Fourier transforms
------------------------

It is easy to see that

h(cos(a*x)) = sqrt(a)*cos(a*x-pi/4)

satisfies the requirement for a half derivative. Similarly for sin(a*x). This means that a Fourier transform provides a way to define the half derivative operator of a function. Since the half derivative of real valued functions are always real valued with this definition, it is different from the half derivative created using a Taylor series.

Demonstration
-------------

The Matlab files demonstrate the half derivative on a sawtooth function and a triangle function. It should be noted that each straight line becomes like a square root.

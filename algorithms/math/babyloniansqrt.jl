#=
This is an implementation of the "Babylonian method" of approximating square roots.
(https://en.wikipedia.org/wiki/Methods_of_computing_square_roots#Babylonian_method)
=#
const steps = 10
const example = 20740

function sqrt(s)
    x = s/2 # arbitrary initial guess for x ≈ √s
    for i in 1:steps
        x = (x + s/x)/2
    end
    x
end

println("√$example ≈ $(sqrt(example)), error = $(abs(sqrt(example)) - (example)^0.5)")

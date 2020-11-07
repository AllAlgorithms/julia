function hamming_distance(a::Integer, b::Integer)
    return count_ones(a⊻b)
end

a = 11 #1011 in binary
b = 2  #0010 in binary

println("Hamming distance between $a and $b is $(hamming_distance(a, b))")
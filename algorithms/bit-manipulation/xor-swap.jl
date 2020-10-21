a = 1
b = 2
println("a = $(a), b = $(b)")
a ⊻= b
b ⊻= a
a ⊻= b
println("a = $(a), b = $(b)")
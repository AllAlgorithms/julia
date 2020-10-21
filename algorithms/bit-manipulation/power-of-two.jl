function ispower2(x::Integer)::Bool
    x>0 && (x & (x-1))==0
end
arr = [1, 2, 3, 4, 8, 10]
for x in arr
    println("$(x) is $(ispower2(x) ? "" : "not ")a power of 2.")
end
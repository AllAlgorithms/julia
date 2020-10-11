

function countingsort!(v::Vector{<:Integer})
    mini, maxi = extrema(v)

    keys = zeros(Int, maxi-mini+1)

    for key in v
        keys[key-mini+1] += 1
    end

    i = 1
    for (key, amount) in enumerate(keys)
        v[i:i+amount-1] .= key+mini-1
        i += amount
    end
    return v
end

v = [144, 89, 4, 9, 95, 12, 86, 25]
println("unsorted array = ",v)

countingsort!(v)

println("counting sorted array = ", v)


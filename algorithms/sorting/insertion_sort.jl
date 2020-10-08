

function insertionsort(v)
    for (i, key) in enumerate(v)
        
        while i > 1 && v[i-1] > key
            v[i] = v[i-1]
            i -= 1
        end
        v[i] = key
    end
    return v
end

v = [144 89 4 9 95 12 86 25]
println("unsorted array = ",v)

sorted_v = insertionsort(v)

println("insertion sorted array = ", sorted_v)
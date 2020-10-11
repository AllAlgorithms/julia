
function mergesort(v)
    lv = length(v)
    if lv == 1
        return v
    else
        return fusion(fusionsort(@view v[1:lv÷2]), fusionsort(@view v[lv÷2+1:end]))
    end
end

function merge(v1, v2)
    if length(v1) == 0
        return v2
    elseif length(v2) == 0
        return v1
    elseif v2[1] < v1[1]
        return vcat(v2[1], merge(v1, @view v2[2:end]))
    else
        return vcat(v1[1], merge((@view v1[2:end]), v2))
    end
end

v = [144, 89, 4, 9, 95, 12, 86, 25]
println("unsorted array = ",v)

sorted_v = mergesort(v)

println("merge sorted array = ", sorted_v)
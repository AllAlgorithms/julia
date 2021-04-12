
function mergesort(v)
    if length(v) <= 1
        return v
    end
    return merge(mergesort(v[1:end÷2]), mergesort(v[end÷2+1:end]))
end

function merge(v1, v2)
    if isempty(v1)
        return v2

    elseif isempty(v2)
        return v1

    elseif v2[1] < v1[1]
        return [v2[1]; merge(v1, v2[2:end])]

    else # v1[1] <= v2[1]
        return [v1[1]; merge(v1[2:end], v2)]
    end
end

v = [144, 89, 4, 9, 95, 12, 86, 25]
println("unsorted array = ", v)

sorted_v = mergesort(v)

println("merge sorted array = ", sorted_v)

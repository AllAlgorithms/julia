function qsort(array)
    if  (isempty(array))
        return array
    else
        pivot = array[1]
        less = [i for i in array[2:end] if i < pivot]
        greater = [i for i in array[2:end] if i >= pivot]
        return vcat(qsort(less), pivot, qsort(greater))
    end
end

v = [144 89 4 9 95 12 86 25]
println("unsorted array = ",v)

sorted_v = qsort(v)

println("selection sorted array = ", sorted_v)

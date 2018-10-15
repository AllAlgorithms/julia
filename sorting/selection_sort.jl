function selectionsort(arr)
    N = length(arr)

    for step in 0:N-2
        m = -1
        idx = -1

        for j in 1:N-step
            if arr[j] > m
                m = arr[j]
                idx = j
            end
        end

        s = arr[N-step]
        arr[N-step] = m
        arr[idx] = s
    end
end

v = [144 89 4 9 95 12 86 25]
println("unsorted array = ",v)

selectionsort(v)

println("selection sorted array = ",v)
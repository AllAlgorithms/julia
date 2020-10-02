function binary_search(array, value, low=1, high=length(array))
    if isempty(array)
        return 0
    end

    if low >= high
        if low > high || array[low] != value
            return 0
        end

        return low
    end

    mid = (low + high) ÷ 2

    if array[mid] > value
        return binary_search(array, value, low, mid-1)
    elseif array[mid] < value
        return binary_search(array, value, mid+1, high)
    end

    return mid
end

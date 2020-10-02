function binarysearch(arr,x,l,r)
    if r>=l
        mid = (l + (r-l)÷2)
        if (arr[mid]==x)
            return mid
        elseif (arr[mid]>x)
            return binarysearch(arr,x,l,mid-1)
        else
            return binarysearch(arr,x,mid+1,r)
        end
    end
    return -1
end

v = [2 3 4 5 9 11 15 78 98 101 169 259]
len = length(v)
x = 170
t = binarysearch(v,x,1,len)
if(t==-1)
    println("Element = ",x," not found")
else
    println("Found element ",x," at = " ,t)
end




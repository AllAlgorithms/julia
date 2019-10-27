function gcd(x,y)
    if x == 0
        return y
    else
        return gcd(y%x,x)
    end
end
function find(arr,n)
    r = arr[1]
    for i=2:n
        r = gcd(arr[i],r)
    end
    return r
end
v = [8 16 8 4]
len = length(v)
println("The GCD of the array is = ",find(v,len))



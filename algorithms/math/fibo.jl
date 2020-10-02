function fib(n)
    p = (1+sqrt(5))/2
    return (round(((p)^n)/sqrt(5)))
end

for i=0:92
    println("fibonacci of ",i," = ",trunc(Int,fib(i)))
end



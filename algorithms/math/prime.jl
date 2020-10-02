function prime(n)
c=0
if n == 1
    println("1 is Neither Prime nor Composite")
else
    for i=2:sqrt(n)
        if n%i == 0
            c=c+1
        end
    end
    if c==0
        println(n, " is a Prime")
    else
        println(n," is Not a Prime")
    end
end
end

i=735997
(prime(i))

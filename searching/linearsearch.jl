function linearsearch(arr,x)
    n = length(arr);t=0;y=0
    for i=1:n
        if (arr[i]==x)
            t=1;y=i
        break
        end
    end
    if (t==1)
        println("element found!! and it's in position = ",y)
    else
        println("not found")
    end
end

v = [144 89 4 9 95 87 86 25]
x = 89
println("list = ",v ," and the number to be searched = ",x)

linearsearch(v,x)



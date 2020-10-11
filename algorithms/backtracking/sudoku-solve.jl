# Sudoku Solver using backtracking


function ispossible(m::Array{Int, 4}, i::CartesianIndex{4}, n)
    return !( 
        n ∈ m[  : ,   : , i[3], i[4]] || # column
        n ∈ m[i[1], i[2],   : ,   : ] || # line
        n ∈ m[  : , i[2],   : , i[4]]    # cell
    )
end


function sudokusolve!(::Array{Int, 4}, ::Nothing)
    # after `CartesianIndex(3,3,3,3)`, `iterate` returns `nothing`
    return true
end

function sudokusolve!(m::Array{Int, 4}, t::Tuple)
    return sudokusolve!(m, t[1])
end

function sudokusolve!(m::Array{Int, 4}, index::CartesianIndex{4})
    next_index = iterate(CartesianIndices(m), index)

    if m[index] != 0
        return sudokusolve!(m, next_index)
    end

    for n in 1:9
        if ispossible(m, index, n)
            m[index] = n
            if sudokusolve!(m, next_index)
                return true
            end
        end
    end

    m[index] = 0
    return false
end

function sudokusolve!(m::Array{Int, 2})
    sudokusolve!(reshape(m, 3, 3, 3, 3), CartesianIndex(1,1,1,1)) # reshape for easier manipulation
end

function string2matrix(s::String)
    return permutedims(reshape(parse.(Int, split(s, "")), 9, 9))
end



m = string2matrix("004300209005009001070060043006002087190007400050083000600000105003508690042910300")

println("Original :")
show(stdout, MIME("text/plain"), m)

sudokusolve!(m)

println("Solved :")
show(stdout, MIME("text/plain"), m)
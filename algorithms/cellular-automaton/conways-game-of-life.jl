# Conways game of life
#
# includes an RLE decoder
# UnicodePlots is used to display the animation in the terminal

using UnicodePlots

function count_neighbors(m::Matrix{Bool}, i::CartesianIndex)
    c = 0
    for j in CartesianIndex.((-1:1)', -1:1)
        j == CartesianIndex(0,0) && continue

        if checkbounds(Bool, m, i+j)
            c += m[i+j]
        end
    end
    return c
end

function gameoflife_step(m::Matrix{Bool}; live, appear)
    nextm = similar(m)
    for i in CartesianIndices(m)
        if m[i]
            nextm[i] = count_neighbors(m, i) ∈ live
        else
            nextm[i] = count_neighbors(m, i) ∈ appear
        end
    end
    return nextm
end

function animate(m::Matrix{Bool}, dt, steps; live=2:3, appear=3)
    print(repr(spy(m; labels=false, title="", canvas=DotCanvas)))
    height = div(size(m, 1), 2, RoundUp) + 1
    t = time()
    for _ in 1:steps
        m = gameoflife_step(m; live=live, appear=appear)
        while time() - t < dt end
        t = time()
        print("\r\u1b[K\u1b[A"^height) # remove previous graph
        print(repr(spy(m; labels=false, title="", canvas=DotCanvas)))
    end
    println()
end


function RLE_decoder(RLE; x, y)
    m = zeros(Bool, y, x)
    i = CartesianIndex(1,1)
    n = 0
    for j in collect(RLE)
        nn = n == 0 ? 1 : n
        if isspace(j)
            continue
        elseif j == '!' # end 
            break
        elseif j == 'b' # dead
            i += CartesianIndex(0, nn)
            n = 0
        elseif j == '$' # new line
            i = CartesianIndex(i[1]+nn, 1)
            n = 0
        elseif j ∈ '0':'9'
            n = 10*n + j - '0'
        else # alive
            for _ in 1:nn
                m[i] = true
                i += CartesianIndex(0, 1)
            end
            n = 0
        end
    end
    return m
end

m = RLE_decoder(raw"16bo30b$16bobo16bo11b$16b2o17bobo9b$obo10bo21b2o10b$b2o11b2o31b$bo11b
2o32b3$10b2o20b2o13b$11b2o19bobo9b3o$10bo21bo11bo2b$27bo17bob$27b2o18b$26bobo!", 
x = 47, 
y = 14)

# add margins
T = 0 # top
B = 10 # bottom
R = 0 # right
L = 0 # left

m = Bool[
    zeros(T, L)         zeros(T, size(m,2)) zeros(T, R)
    zeros(size(m,1), L) m                   zeros(size(m,1), R)
    zeros(B, L)         zeros(B, size(m,2)) zeros(B, R)
]

animate(m, 0.01, 200)
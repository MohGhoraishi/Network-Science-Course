#module RandomNetwork
#export GenerateNetwork

"""
    GenerateNetwork(lambda::Float64, N::Integer, UseTrueRandom::Bool)

Generates a random network with average degree lambda and nodes N.

# Arguments
* `lambda` = the average degree of all nodes.
* `N` = Number of nodes in the network.
* `UseTrueRandom` = if true generates the vertices randomly and the degrees wouldn't be exactly equal to lambda. If false it will decide how 
    many vertices should be placed, then randomly distributes them.

# Notes

"""

function GenerateNetwork(lambda::Number, N::Integer, UseTrueRandom::Bool)
    Network = []
    for i in 1:N
        push!(Network, [])
    end
    if UseTrueRandom == true
        Probability = lambda / (N - 1)
        for i in 1:N-1
            for j in i+1:N
                if rand() <= Probability
                    push!(Network[i], j)
                    push!(Network[j], i)
                end
            end
        end
    end
    if UseTrueRandom == false
        VerticesNumber = floor(Int, lambda * N)
        for i in 1:VerticesNumber
            RandNodeOne = rand(1:N)
            RandNodeTwo = rand(1:N)
            push!(Network[RandNodeOne], RandNodeTwo)
            push!(Network[RandNodeTwo], RandNodeOne)
        end
    end
    return Network
end

g = GenerateNetwork(1.5, 10, false)
for i in 1:10
    
end
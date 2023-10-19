module RandomNetwork
export GenerateNetwork

"""
    GenerateNetwork(lambda::Float64, N::Integer, AlgorithmType::Int)

Generates a random network with average degree lambda and nodes N.

# Arguments
* `lambda` = the average degree of all nodes.
* `N` = Number of nodes in the network.
* `AlgorithmType` = if type 1 is selected, vertices will be generated with a probability and multiple vertices between the same nodes wouldn't exist
                    if type 2 is selected, then an exact number of vertices will be generated and then they would be randomly distributed.
# Notes

"""

function GenerateNetwork(lambda::Number, N::Integer, AlgorithmType::Int)
    Network::Vector{Vector{Int64}} = []
    for i in 1:N
        push!(Network, [])
    end
    if AlgorithmType == 1
        Probability = lambda / (N - 1)
        for i in 1:N-1
            for j in i+1:N
                if rand() <= Probability
                    push!(Network[i], j)
                    push!(Network[j], i)
                end
            end
        end
    elseif  AlgorithmType == 2
        VerticesNumber = floor(Int, lambda * N / 2)
        for i in 1:VerticesNumber
            RandNodeOne = rand(1:N)
            RandNodeTwo = rand(1:N)
            push!(Network[RandNodeOne], RandNodeTwo)
            push!(Network[RandNodeTwo], RandNodeOne)
        end
    else
        return error("AlgorithmType must have values in [1, 2]")
    end
    return Network
end

end
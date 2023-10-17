#module RandomNetwork
#export GenerateNetwork

"""
    initializeRoad(numberLanesRoad::Integer, startingDensity::Float64, averageCarLengthDriver::Float64)

Initializes a road with a random distribution of cars with a selected total density.

# Arguments
* `numberLanesRoad` = the number of lanes in our road.
* `startingDensity` = the density of cars we want on our road.
* `averageCarLengthDriver` = the average langth of a car.
* `resolution` = Splits up the available space into smaller chunks

# Notes
* The function is randomized and does not fill the road with the exact density that is specified

"""

function GenerateNetwork(lambda::Float64, N::Integer, UseTrueRandom::Bool)
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
        

    end
    return Network
end

g = GenerateNetwork(1.5, 10, true)
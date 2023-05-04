module XorPkg
using Base.Threads

export forXor!, broadcastXor!, threadsXor!

"""
forXor!(output, ina, inb)

Computes the element wise XOR of ina and inb, modified output inplace

Output is modified inplace to contain the element wise XOR of ina and inba
The computation is done using a for loop that sets the value of each element 
of output vector sequentially

# Arguments
* `output`: The output vector of type Vector{UInt64}
* `ina`: Input vector of type Vector{UInt64}
* `inb`: Input vector of type Vector{UInt64}

# Examples
```julia
julia> output = zeros(UInt64, 10)
julia> ina = rand(UInt64, 10)
julia> inb = rand(UInt64, 10)
julia> forXor!(output, ina, inb)
```
"""
function forXor!(output::Vector{UInt64}, ina::Vector{UInt64}, inb::Vector{UInt64})

  # Check that all three vectors are of equal length
  @assert length(output) == length(ina) == length(inb)

  # Compute element wise XOR using for loop
  for i in eachindex(output)
      output[i] = ina[i] ⊻ inb[i]
  end
end


"""
broadcastXor!(output, ina, inb)

Computes the element wise XOR of ina and inb, modified output inplace

Output is modified inplace to contain the element wise XOR of ina and inba
The computation is done using the element wise broadcast `.⊻` operation and 
sets the value of output vector 

# Arguments
* `output`: The output vector of type Vector{UInt64}
* `ina`: Input vector of type Vector{UInt64}
* `inb`: Input vector of type Vector{UInt64}

# Examples
```julia
julia> output = zeros(UInt64, 10)
julia> ina = rand(UInt64, 10)
julia> inb = rand(UInt64, 10)
julia> broadcastXor!(output, ina, inb)
```
"""
function broadcastXor!(output::Vector{UInt64}, ina::Vector{UInt64}, inb::Vector{UInt64})
  
  # Check that all three vectors are of equal length
  @assert length(output) == length(ina) == length(inb)

  # Compute element wise XOR using element wise broadcast operation
  output = ina .⊻ inb
end


"""
threadsXor!(output, ina, inb)

Computes the element wise XOR of ina and inb, modified output inplace

Output is modified inplace to contain the element wise XOR of ina and inba
The computation is done using @threads macro that sets the value of each element
of output vector parallely using Threads.nthreads() number of threads

# Arguments
* `output`: The output vector of type Vector{UInt64}
* `ina`: Input vector of type Vector{UInt64}
* `inb`: Input vector of type Vector{UInt64}

# Examples
```julia
julia> output = zeros(UInt64, 10)
julia> ina = rand(UInt64, 10)
julia> inb = rand(UInt64, 10)
julia> threadsXor!(output, ina, inb)
```
"""
function threadsXor!(output::Vector{UInt64}, ina::Vector{UInt64}, inb::Vector{UInt64})

  # Check that all three vectors are of equal length
  @assert length(output) == length(ina) == length(inb)

  # Compute element wise XOR using threads macro
  @threads for i in eachindex(output)
    output[i] = ina[i] ⊻ inb[i]
  end
end

end

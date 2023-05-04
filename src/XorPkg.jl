module XorPkg
using Base.Threads

export forXor, broadcastXor, threadsXor


function forXor(output::Vector{UInt64}, ina::Vector{UInt64}, inb::Vector{UInt64})
  @assert length(output) == length(ina) == length(inb)
  for i in eachindex(output)
      output[i] = ina[i] ⊻ inb[i]
  end
end

function broadcastXor(output::Vector{UInt64}, ina::Vector{UInt64}, inb::Vector{UInt64})
  @assert length(output) == length(ina) == length(inb)
  output .= ina .⊻ inb
end

function threadsXor(output::Vector{UInt64}, ina::Vector{UInt64}, inb::Vector{UInt64})
  @assert length(output) == length(ina) == length(inb)
  @threads for i in eachindex(output)
    output[i] = ina[i] ⊻ inb[i]
  end
end

end

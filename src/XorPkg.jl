module XorPkg
using Base.Threads

export forXor, broadcastXor, threadsXor


function forXor(output, ina, inb)
  @assert length(output) == length(ina) == length(inb)
  for i in eachindex(output)
      output[i] = ina[i] ⊻ inb[i]
  end
end

function broadcastXor(output, ina, inb)
  @assert length(output) == length(ina) == length(inb)
  output .= ina .⊻ inb
end

function threadsXor(output, ina, inb)
  @assert length(output) == length(ina) == length(inb)
  @threads for i in eachindex(output)
    output[i] = ina[i] ⊻ inb[i]
  end
end

end

using XorPkg
using Test
using BenchmarkTools

@testset "XorPkg.jl" begin
    # Write your tests here.
    output = zeros(UInt64, 10)
    ina = rand(UInt64, 10)
    inb = rand(UInt64, 10)
    forXor!(output, ina, inb)

    @test output == ina .⊻ inb 

    output = zeros(UInt64, 10)
    ina = rand(UInt64, 10)
    inb = rand(UInt64, 10)
    threadsXor!(output, ina, inb)
    
    @test output == ina .⊻ inb 
end



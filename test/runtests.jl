using XorPkg
using Test

@testset "XorPkg.jl" begin
    # Write your tests here.

    output = zeros(UInt64, 10)
    ina = rand(UInt64, 10)
    inb = rand(UInt64, 10)

    forXor(output, ina, inb)
    print(output)
    @test output == ina .⊻ inb 
end

using Test
using Repos

include("mechanics.jl")
include("usecase.jl")

@testset "Internal Mechanics" begin
    swaptest()
    classtest()
end

@testset "Usecase Tests     " begin
    divisortest()
end

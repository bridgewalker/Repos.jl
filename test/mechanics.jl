

# This is to make sure the swap operation does not make a mess
function swaptest()
    @testset "swap" begin
        r=Repo{String}(100,3)
        for i in 1:500           # We shuffle the array
            f=mod1(i*12345,100)  # Make some quick random numbers
            t=mod1(i*54321,100)
            Repos._swap(r,f,t)
        end
        for i=1:100          # Now test if the state is still consistent
            @test r.pos[r.ids[i]]==i
        end
    end
end

# Test for setclass and getclass functionality
function classtest()
    @testset "class" begin
        r=Repo{String}(4,4)
        setclass!(r,4,1)
        setclass!(r,3,2)
        setclass!(r,2,3)
        setclass!(r,1,4)
        @test getclass(r,1)==4
        @test getclass(r,2)==3
        @test getclass(r,3)==2
        @test getclass(r,4)==1
    end
end



# In this test we classify integers accoring to their divisor
function divisortest()
    @testset "divisortest" begin
        ar=[1:100...]
        r=Repo(ar,4)
        for i in 1:100
            a=mod(r[i],2)
            b=mod(r[i],3)
            if a==0 && b!=0 setclass!(r,i,2); end    #dividble by 2 but not 3
            if a!=0 && b==0 setclass!(r,i,3); end    #dividble by 3 but not 2
            if a==0 && b==0 setclass!(r,i,4); end    #dividble by 6
        end
        divble=class(r,4)
        @test length(divble)==16    # 16 numbers<=100 muliples of 6
        N=0
        for x in divble
            N+=1
            @test mod(x,6)==0
        end
        @test N==16
    end
    return true
end

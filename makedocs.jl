
include("docs/make.jl")
mv("docs\\build\\assets\\siteinfo.js","docs\\build\\siteinfo.js")
cp("docs\\build","..\\Repos-Pages\\v0.1.0",force=true)

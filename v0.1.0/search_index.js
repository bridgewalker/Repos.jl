var documenterSearchIndex = {"docs":
[{"location":"functions/#Repo.jl-List-of-functions-1","page":"Repo.jl - List of functions","title":"Repo.jl - List of functions","text":"","category":"section"},{"location":"#Repos.jl-1","page":"Getting Started","title":"Repos.jl","text":"","category":"section"},{"location":"#","page":"Getting Started","title":"Getting Started","text":"Repos provides a highly efficient data structure (Repo) that can be used for organizing data into a set of \"classes\".","category":"page"},{"location":"#","page":"Getting Started","title":"Getting Started","text":"Repo behaves like an array, where you can additionally assign each element of the array to a \"class\". You can dynamically change the an element's class, find out how many elements are in a certain class, iterate through the elements in a given class or pick a single element from a class (e.g. at random).","category":"page"},{"location":"#","page":"Getting Started","title":"Getting Started","text":"Importantly, the time required for these operations is independent of the number of elements stored in Repo and only linearly increases with the number of classes. Thereby Repo enables extremely fast (linear time) agent-based simulations.   ","category":"page"},{"location":"#Example-1","page":"Getting Started","title":"Example","text":"","category":"section"},{"location":"#","page":"Getting Started","title":"Getting Started","text":"julia> using Repos\r\n\r\njulia> a=[\"Pepsis grossa\",\"Smilodon populator\",\"Nothrotheriops texanus\",\"Phoberomys pattersoni\"]\r\n4-element Array{String,1}:\r\n \"Pepsis grossa\"\r\n \"Smilodon populator\"\r\n \"Nothrotheriops texanus\"\r\n \"Phoberomys pattersoni\"\r\n\r\njulia> animals=Repo(a,2)\r\nRepository of 4 objects in 2 classes\r\n\r\njulia> alive=class(animals,2)\r\nClass of 0 objects\r\n\r\njulia> setclass!(animals,1,2)\r\n\r\njulia> print_repo(animals)\r\nRepository of 2 classes\r\n  Class 1\r\n    1 - 4: Phoberomys pattersoni\r\n    2 - 2: Smilodon populator\r\n    3 - 3: Nothrotheriops texanus\r\n  Class 2\r\n    1 - 1: Pepsis grossa\r\n\r\njulia> print_repo(alive)\r\nClass of 1 objects\r\n    1 - 1: Pepsis grossa\r\n\r\njulia> alive[1]\r\n\"Pepsis grossa\"","category":"page"},{"location":"#Installation-1","page":"Getting Started","title":"Installation","text":"","category":"section"},{"location":"#","page":"Getting Started","title":"Getting Started","text":"Install with the Julia package manager. From the Julia REPL, type ] to enter the Pkg REPL mode and","category":"page"},{"location":"#","page":"Getting Started","title":"Getting Started","text":"pkg> add Repos","category":"page"},{"location":"#","page":"Getting Started","title":"Getting Started","text":"Alternatively from Julia","category":"page"},{"location":"#","page":"Getting Started","title":"Getting Started","text":"julia> import Pkg\r\n\r\njulia> Pkg.add(\"Repos\")","category":"page"},{"location":"#Further-Documentation-1","page":"Getting Started","title":"Further Documentation","text":"","category":"section"},{"location":"#","page":"Getting Started","title":"Getting Started","text":"Member ID vs. Position\nList of functions\nIteration and Interfaces","category":"page"},{"location":"#Project-Status-1","page":"Getting Started","title":"Project Status","text":"","category":"section"},{"location":"#","page":"Getting Started","title":"Getting Started","text":"This package was tested on Julia 1.4.2 on Windows.","category":"page"}]
}

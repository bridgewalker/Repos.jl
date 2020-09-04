
## History

In 2006 Bernd Blasius and I did some calculations that predicted something surprising: Under certain circumstances, the way society reacts to an epidemic disease can lead to
oscillations where the prevalence of an epidemic increases and decreases in a regular pattern. That was a nice new insight but to verify the maths we needed to run agent-based simulations.

In small simulations the predicted oscillations did not happen. The reason was that even in a simulation with some thousand agents random events randomness at the agent level can still have a significant impact. This created a lot of noise that destroyed the oscillations.

We needed bigger simulations. Agent based simulations on a network suffer from bad data locality and hence don't parallelize well. So they remain challenging.

In principle agent-based simulation can be done extremely quickly using a technique called event-driven (Gillespie) simulation. In an event driven simulation there is certain functions that are called many times: finding out how many agents are in a given state (i.e. infected), picking a random agent who has a certain state and changing the state an agent is in.

To speed up my simulations I came up with the Repo data structure. Repo implements the three tasks (counting, choosing, changing) such that their execution times are independent of the number of agents.

In agent-based modelling, and perhaps other computational Repo enables creating some very fast codes. In our case that allowed to run very fast epidemic simulations with tens of millions of agents. The paper from our initial application, described above is

> T. Gross, C. Dommar D'Lima and B. Blasius: Epidemic dynamics
> on an adaptive network. Physical Review Letters 96, 208701,
> (2006).

The Repos.jl package is the first implementation of Repo in Julia.  

## Contributing

I welcome contributions and feature requests.

## Acknowledgements

The original development of Repo was supported by the Volkswagen foundation. The current implementation in Julia was developed at HIFMB, a collaboration between the Alfred-Wegener-Institute, Helmholtz-Center for Polar and Marine Research, and the Carl-von-Ossietzky University Oldenburg, initially funded by the Ministry for Science and Culture of Lower Saxony (MWK) and the Volkswagen Foundation through the “Nieders&auml;chsisches Vorab” grant program (grant number ZN3285).

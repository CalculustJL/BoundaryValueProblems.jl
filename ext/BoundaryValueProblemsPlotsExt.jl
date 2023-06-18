module BoundaryValueProblemsPlotsExt

using Plots
using BoundaryValueProblems

function Plots.plot(sol::BoundaryValueSolution{<:Number, 1})
    plot(sol.u, sol.cache.space)
end

function Plots.plot(sol::BoundaryValueSolution{<:Number, 2}; a = 45, b = 60)
    plot(sol.u, sol.cache.space)
end

end

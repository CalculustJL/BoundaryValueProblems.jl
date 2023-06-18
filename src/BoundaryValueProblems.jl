"""
Boundary Value Problem Interface for `CalculustJL`
"""
module BoundaryValueProblems

using DocStringExtensions

using Reexport
@reexport using SciMLBase
@reexport using CalculustCore

using SciMLOperators: AbstractSciMLOperator, IdentityOperator

using CalculustCore.Domains: AbstractDomain
using CalculustCore.Spaces: AbstractSpace, AbstractDiscretization

using UnPack: @unpack
using LinearAlgebra
using LinearSolve

@static if !isdefined(Base, :get_extension)
    import Requires
end

@static if !isdefined(Base, :get_extension)
    function __init__()
        Requires.@require Plots = "91a5bcdd-55d7-5caf-9e0b-520d859cae80" begin
            include("../ext/BoundaryValueProblemsPlotsExt.jl")
        end
    end
end

"""
$TYPEDEF
"""
abstract type AbstractBoundaryCondition{T} end

"""
$TYPEDEF
"""
abstract type AbstractBoundaryValueProblem <: SciMLBase.DEProblem end

"""
$TYPEDEF
"""
abstract type AbstractBoundaryValueCache <: SciMLBase.DECache end

"""
$TYPEDEF
"""
abstract type AbstractBoundaryValueAlgorithm <: SciMLBase.DEAlgorithm end

include("utils.jl")
include("conditions.jl")

include("types.jl")
include("make_lhs_rhs.jl")
include("problem.jl")

export
      # boundary conditions
      DirichletBC, NeumannBC, RobinBC, PeriodicBC,

      # boundary vale problem
      BoundaryValueProblem, BoundaryValueSolution,

      # boundary value algorithms
      LinearBoundaryValueAlg, NonlinearBoundaryValueAlg

end

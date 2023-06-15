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
      BoundaryValueProblem,

      # boundary value algorithms
      LinearBoundaryValueAlg, NonlinearBoundaryValueAlg

end

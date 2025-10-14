
abstract type Part end

"""
    mass(p::Part)
"""
function mass end

"""
    com(p::Part)
"""
function com end

"""
    moi_z(p::Part)
"""
function moi_z end

include("AnnularPart.jl")
include("PrismPart.jl")
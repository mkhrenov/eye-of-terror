struct AnnularPart
    name::String
    material::Material
    r_o::Float64   # Outer radius, meters
    r_i::Float64   # Inner radius, meters
    t::Float64     # Thickness, meters 
end


function mass(p::AnnularPart)
    return π * (p.r_o^2 - p.r_i^2) * p.t * p.material.ρ
end

function com(p::AnnularPart)
    return SVector{3,Float64}(0, 0, 0)
end

function moi_z(p::AnnularPart)
    return (1 / 2) * mass(p) * (p.r_i^2 + p.r_o^2)
end
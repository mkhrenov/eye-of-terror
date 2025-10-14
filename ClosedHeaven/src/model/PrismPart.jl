struct PrismPart
    name::String
    material::Material
    l::Float64          # Length, meters
    w::Float64          # Width, meters
    h::Float64          # Height, meters 
end


function mass(p::PrismPart)
    return p.l * p.w * p.h * p.material.ρ
end

function com(p::PrismPart)
    return SVector{3,Float64}(0, 0, 0)
end

function moi_z(p::PrismPart)
    return (1 / 12) * mass(p) * (p.w^2 + p.l^2)
end
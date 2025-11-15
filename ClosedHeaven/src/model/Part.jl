
struct Part{T}
    name::String
    material::Material
    mass::T
    com::SVector{3,T}
    moi::SMatrix{3,3,T}
end

function mass(p::Part)
    return p.mass
end

function com(p::Part)
    return p.com
end

function moi(p::Part)
    return p.moi
end

function annular_part(name, material, r_i::T, r_o::T, t::T) where {T}
    m = π * (r_o^2 - r_i^2) * t * material.ρ
    p = SVector{3,T}(0.0, 0.0, 0.0) # TODO
    I = SMatrix{3,3,T}(
        (1 / 12) * m * (3 * (r_i^2 + r_o^2) + t^2), 0, 0,
        0, (1 / 12) * m * (3 * (r_i^2 + r_o^2) + t^2), 0,
        0, 0, (1 / 2) * m * (r_i^2 + r_o^2),
    )

    return Part{T}(
        name,
        material,
        m, p, I
    )
end

# l - x, w - y, h - z
function prismatic_part(name, material, l::T, w::T, h::T) where {T}
    m = l * w * h * material.ρ
    p = SVector{3,T}(0.0, 0.0, 0.0) # TODO
    I = SMatrix{3,3,T}(
        (1 / 12) * m * (w^2 + h^2), 0, 0,
        0, (1 / 12) * m * (l^2 + h^2), 0,
        0, 0, (1 / 12) * m * (l^2 + w^2),
    )

    return Part{T}(
        name,
        material,
        m, p, I
    )
end
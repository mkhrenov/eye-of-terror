struct Airfoil{T}
    c_d::T      # Drag coefficient
    c_l::T      # Lift coefficient
    c::T        # Cord length
    s::T        # Wingspan
    ρ::T        # Density of air
end

function lift(v, airfoil::Airfoil)
    ρ = airfoil.ρ
    c_l = airfoil.c_l
    S = airfoil.c * airfoil.s

    return (1 / 2) * ρ * v^2 * S * c_l
end

function drag(v, airfoil::Airfoil)
    ρ = airfoil.ρ
    c_d = airfoil.c_d
    S = airfoil.c * airfoil.s

    return (1 / 2) * ρ * v^2 * S * c_d
end
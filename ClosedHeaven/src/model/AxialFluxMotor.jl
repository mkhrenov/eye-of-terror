struct AxialFluxMotor{T}
    Np::Int     # Number of poles (multiple of 2)
    Ns::Int     # Number of slots (multiple of 3)
    Nt::Int     # Number of turns per slot
    r_o::T      # Stator winding OD
    r_i::T      # Stator winding ID
    B::T        # Magnetic field strength, Tesla
    d::T        # Winding wire diameter
    ρ::T        # Winding wire resistivity
end

function ke(motor::AxialFluxMotor)
    N = (motor.Ns * motor.Nt) ÷ 3
    B, r_o, r_i = motor.B, motor.r_o, motor.r_i

    return N * B * (r_o^2 - r_i^2)
end

function kt(motor::AxialFluxMotor)
    return ke(motor)
end

function resistance(motor::AxialFluxMotor)
    Nt, Ns, r_o, r_i = motor.Nt, motor.Ns, motor.r_o, motor.r_i
    A = (π / 4) * motor.d^2
    S = Nt * ((2π / 3) * (r_i + r_o) + (Ns ÷ 3) * 2 * (r_o - r_i)) + (4π / 3) * r_i

    return motor.ρ * S / A
end

function inductance(motor::AxialFluxMotor; μ₀=4π * 1e-7)
    Nt, Ns, r_o, r_i = motor.Nt, motor.Ns, motor.r_o, motor.r_i
    N = (Ns * Nt) ÷ 3
    D = √((r_o^2 - r_i^2) / Ns)

    return μ₀ * (D / 2) * (log(8D / motor.d) - 2) * N
end
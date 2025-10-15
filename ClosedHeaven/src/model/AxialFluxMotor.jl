struct AxialFluxMotor{T}
    Np::Int     # Number of poles (multiple of 2)
    Ns::Int     # Number of slots (multiple of 3)
    Nt::Int     # Number of turns per slot
    r_o::T      # Stator winding OD
    r_i::T      # Stator winding ID
    B::T        # Magnetic field strength, Tesla
end
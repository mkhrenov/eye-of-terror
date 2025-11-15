struct AeroShell{T}
    motor::AxialFluxMotor{T}
    airfoil::Airfoil{T}
    battery::Battery{T}
    rotor_asm::Assembly{T}
    stator_asm::Assembly{T}

    function AeroShell(
        r_stator_i::T,
        r_stator_o::T,
        r_wing::T,
        t_blade::T,
        t_carrier::T,
        t_backiron::T,
        t_plate::T,
        t_pcb::T,
        w_wing::T,
        spacing::T,
        clearance::T,
        battery::Battery{T},
        c_l::T,
        c_d::T,
    ) where {T}

        stator_asm = Assembly{T}(
            prismatic_part("Battery", LiPo(), battery.l, battery.w, battery.h),
            annular_part("Top Plate", Al6061(), 0.0, r_stator_i - spacing - clearance, t_plate),
            annular_part("Bottom Plate", Al6061(), 0.0, r_stator_i - spacing - clearance, t_plate),
            annular_part("Top Backiron", Steel1018(), r_stator_i, r_stator_o, t_backiron),
            annular_part("Bottom Backiron", Steel1018(), r_stator_i, r_stator_o, t_backiron),
            annular_part("Top Magnet Carrier", Al6061(), r_stator_i, r_stator_o, t_carrier),
            annular_part("Bottom Magnet Carrier", Al6061(), r_stator_i, r_stator_o, t_carrier),
            
        )
    end
end

for op = (:mass, :com, :moi)
    eval(:($op(aeroshell::AeroShell) = ($op(aeroshell.rotor_asm) + $op(aeroshell.stator_asm))))
end
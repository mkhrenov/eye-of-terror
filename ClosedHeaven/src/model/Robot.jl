struct Robot{RotorPartTuple,StatorPartTuple}
    motor::AxialFluxMotor
    airfoil::Airfoil
    battery::Battery
    rotor_asm::Assembly{RotorPartTuple}
    stator_asm::Assembly{StatorPartTuple}

    function Robot()
        
    end
end
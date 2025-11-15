struct Assembly{T}
    parts::Vector{Part{T}}
end


function mass(asm::Assembly)
    return sum(mass, asm.parts)
end

function com(asm::Assembly)
    return sum(com, asm.parts)
end

function moi(asm::Assembly)
    return sum(moi, asm.parts)
end
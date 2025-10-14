struct Assembly{PartTuple<:Tuple}
    parts::PartTuple
end


@generated function mass(asm::Assembly{PT}) where {PT}
    N = length(asm.parts)

    ex = :(m = 0.0)
    for i in 1:N
        push!(ex.args, :(m += mass(asm.parts[$i])))
    end
    push!(ex.args, :(return m))

    return ex
end

@generated function com(asm::Assembly{PT}) where {PT}
    N = length(asm.parts)

    ex = :(p = SVector{3,Float64}(0, 0, 0))
    for i in 1:N
        push!(ex.args, :(p += com(asm.parts[$i])))
    end
    push!(ex.args, :(return p))

    return ex
end

@generated function moi_z(asm::Assembly{PT}) where {PT}
    N = length(asm.parts)

    ex = :(moi = 0.0)
    for i in 1:N
        push!(ex.args, :(moi += com(asm.parts[$i])))
    end
    push!(ex.args, :(return moi))

    return ex
end
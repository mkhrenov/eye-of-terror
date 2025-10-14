struct Material
    name::String
    ρ::Float64      # Density (kg/m³)
end

function Base.show(io:IO, material::Material)
    print(io, "$(material.name): ρ = $(round(material.ρ, digits=1)) kg/m³")
end

AR500 = Material("AR500 Steel", 7850.0)
Steel1018 = Material("1018 Steel", 7850.0)
Al6061 = Material("6061 Aluminum", 2700.0)
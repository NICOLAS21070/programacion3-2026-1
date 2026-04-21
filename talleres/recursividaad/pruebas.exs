vuelos = [
  %{codigo: "AV201", aerolinea: "Avianca", origen: "BOG", destino: "MDE", duracion: 45, precio: 180_000, pasajeros: 120, disponible: true},
  %{codigo: "LA305", aerolinea: "Latam", origen: "BOG", destino: "CLO", duracion: 55, precio: 210_000, pasajeros: 98, disponible: true},
  %{codigo: "AV410", aerolinea: "Avianca", origen: "MDE", destino: "CTG", duracion: 75, precio: 320_000, pasajeros: 134, disponible: false},
  %{codigo: "VV102", aerolinea: "Viva Air", origen: "BOG", destino: "BAQ", duracion: 90, precio: 145_000, pasajeros: 180, disponible: true}
]

# 1. Códigos de vuelos disponibles

resultado1 =
  vuelos
  |> Enum.filter(&(&1.disponible))
  |> Enum.map(&(&1.codigo))
  |> Enum.sort()

IO.inspect(resultado1)


# 2. Pasajeros totales por aerolínea

resultado2 =
  vuelos
  |> Enum.group_by(&(&1.aerolinea))
  |> Enum.map(fn {aerolinea, lista} ->
    {aerolinea, lista |> Enum.map(&(&1.pasajeros)) |> Enum.sum()}
  end)

IO.inspect(resultado2)


# 3. Formatear duración de vuelos

resultado3 =
  vuelos
  |> Enum.map(fn v ->
    horas = div(v.duracion, 60)
    minutos = rem(v.duracion, 60)

    minutos_str =
      if minutos < 10 do
        "0#{minutos}"
      else
        "#{minutos}"
      end

    "#{v.codigo} — #{v.origen} → #{v.destino}: #{horas}h #{minutos_str}m"
  end)

IO.inspect(resultado3)


# 4. Vuelos con descuento si precio < 400000

resultado4 =
  vuelos
  |> Enum.filter(&(&1.precio < 400_000))
  |> Enum.map(fn v ->
    {v.codigo, "#{v.origen}-#{v.destino}", v.precio * 0.9}
  end)
  |> Enum.sort_by(fn {_, _, precio} -> precio end)

IO.inspect(resultado4)


# 5. Aerolíneas con vuelos corto, medio y largo

resultado5 =
  vuelos
  |> Enum.group_by(&(&1.aerolinea))
  |> Enum.filter(fn {_aerolinea, lista} ->

    categorias =
      lista
      |> Enum.map(fn v ->
        cond do
          v.duracion < 60 -> :corto
          v.duracion <= 120 -> :medio
          true -> :largo
        end
      end)

    Enum.member?(categorias, :corto) and
    Enum.member?(categorias, :medio) and
    Enum.member?(categorias, :largo)

  end)
  |> Enum.map(fn {aerolinea, _} -> aerolinea end)

IO.inspect(resultado5)


# 6. 3 rutas más rentables

resultado6 =
  vuelos
  |> Enum.filter(&(&1.disponible))
  |> Enum.map(fn v -> {"#{v.origen} → #{v.destino}", v.precio * v.pasajeros} end)
  |> Enum.sort_by(fn {_, ingreso} -> -ingreso end)
  |> Enum.take(3)

IO.inspect(resultado6)

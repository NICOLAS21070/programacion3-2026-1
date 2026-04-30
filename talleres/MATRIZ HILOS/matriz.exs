defmodule MatrizConcurrente do

  def main do
    matriz = [
      [60, 22, 41, 5],
      [13, 33, 44, 5],
      [89, 10, 100, 99],
      [5, 101, 6, 34]
    ]

    parent = self()

    # T1 → S1
    spawn(fn ->
      a = suma_debajo_diagonal(matriz)
      send(parent, {:t1, a})
    end)

    # T2 → S2
    spawn(fn ->
      b = promedio(matriz)
      send(parent, {:t2, b})
    end)

    # Esperar resultados (equivalente a join)
    a = recibir(:t1)
    b = recibir(:t2)

    # S3
    c = a * b


    IO.puts("S1 - Suma debajo de la diagonal principal: #{a}")
    IO.puts("S2 - Promedio de todos los números: #{b}")
    IO.puts("S3 - C = a * b")
    IO.puts("S4 - Resultado final C = #{c}")
  end

  # Recibir mensajes
  defp recibir(tag) do
    receive do
      {^tag, valor} -> valor
    end
  end

  # S1: suma debajo de la diagonal principal
  defp suma_debajo_diagonal(matriz) do
    matriz
    |> Enum.with_index()
    |> Enum.reduce(0, fn {fila, i}, acc ->
      fila
      |> Enum.with_index()
      |> Enum.reduce(acc, fn {val, j}, acc2 ->
        if j < i do
          acc2 + val
        else
          acc2
        end
      end)
    end)
  end

  # S2: promedio de todos los números
  defp promedio(matriz) do
    {suma, cantidad} =
      matriz
      |> List.flatten()
      |> Enum.reduce({0, 0}, fn x, {s, c} ->
        {s + x, c + 1}
      end)

    suma / cantidad
  end

end

# Ejecutar
MatrizConcurrente.main()

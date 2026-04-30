defmodule Matriz do

  def main do
    matriz = [
      [60, 22, 41, 5],
      [13, 33, 44, 5],
      [89, 10, 100, 99],
      [5, 101, 6, 34]
    ]

    # t1 → s1
    t1 = Task.async(fn ->
      matriz
      |> Enum.with_index()
      |> Enum.reduce(0, fn {fila, i}, acc ->
        fila
        |> Enum.with_index()
        |> Enum.reduce(acc, fn {valor, j}, acc2 ->
          if i > j, do: acc2 + valor, else: acc2
        end)
      end)
    end)

    # t2 → s2
    t2 = Task.async(fn ->
      {suma, total} =
        matriz
        |> List.flatten()
        |> Enum.reduce({0, 0}, fn x, {acc, count} ->
          {acc + x, count + 1}
        end)

      suma / total
    end)

    # esperar resultados (join automático)
    a = Task.await(t1)
    b = Task.await(t2)

    # s3
    c = a * b

    # s4
    IO.puts("S1 (suma debajo diagonal): #{a}")
    IO.puts("S2 (promedio): #{b}")
    IO.puts("S3 y S4 (c = a * b): #{c}")
  end

end

Matriz.main()

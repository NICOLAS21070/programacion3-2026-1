defmodule Numeros do
  def es_perfecto(n) when n <= 1, do: false

  def es_perfecto(n) do
    suma = suma_divisores(n, 1, 0)
    suma == n
  end

  # Recursión de cola
  defp suma_divisores(n, divisor, acumulador) when divisor == n do
    acumulador
  end

  defp suma_divisores(n, divisor, acumulador) do
    if rem(n, divisor) == 0 do
      suma_divisores(n, divisor + 1, acumulador + divisor)
    else
      suma_divisores(n, divisor + 1, acumulador)
    end
  end
end

defmodule Main do
  def iniciar do
    n =
      IO.gets("Ingrese un número: ")
      |> String.trim()
      |> String.to_integer()

    if Numeros.es_perfecto(n) do
      IO.puts("#{n} es un número perfecto")
    else
      IO.puts("#{n} NO es un número perfecto")
    end
  end
end
Main.iniciar()

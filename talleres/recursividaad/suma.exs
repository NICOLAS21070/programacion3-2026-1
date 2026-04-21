defmodule ListaRecursiva do
  # Caso base: lista vacía
  def sumar([]), do: 0

  # Caso recursivo
  def sumar([head | tail]) do
    head + sumar(tail)
  end
end

# Ejemplo de uso
IO.puts(ListaRecursiva.sumar([1, 2, 3, 4, 5]))

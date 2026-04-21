defmodule MatrizRecursiva do
  def recorrer_matriz([]), do: 0

  def recorrer_matriz([fila | resto_filas]) do
    recorrer_fila(fila) + recorrer_matriz(resto_filas)
  end

  def recorrer_fila([]), do: 0

  def recorrer_fila([elemento | resto]) do
    elemento + recorrer_fila(resto)
  end
end

matriz = [
  [1, 2, 3],
  [3, 4, 5],
  [6, 7, 8]
]

resultado = MatrizRecursiva.recorrer_matriz(matriz)
IO.puts(resultado)

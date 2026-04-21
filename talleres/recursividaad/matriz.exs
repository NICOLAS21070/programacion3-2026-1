defmodule MatrizRecursiva do
  def recorrer_diagonal(matriz) do
    recorrer_diagonal(matriz, 0)
  end

  # Caso base: matriz vacía
  def recorrer_diagonal([], _indice), do: :ok

  # Caso recursivo
  def recorrer_diagonal([fila | resto_filas], indice) do
    elemento = obtener_elemento(fila, indice)
    IO.puts(elemento)
    recorrer_diagonal(resto_filas, indice + 1)
  end

  # Función para obtener el elemento en una posición
  def obtener_elemento([elemento | _], 0), do: elemento

  def obtener_elemento([_ | resto], indice) do
    obtener_elemento(resto, indice - 1)
  end
end

# Ejemplo
matriz = [
  [1, 2, 3],
  [3, 4, 5],
  [6, 7, 8]
]

MatrizRecursiva.recorrer_diagonal(matriz)

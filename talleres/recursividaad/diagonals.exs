defmodule MatrizRecursiva do
  # Función principal (empieza en el último índice: 2)
  def recorrer_diagonal(matriz) do
    recorrer_diagonal(matriz, 2)
  end

  # Caso base
  def recorrer_diagonal([], _indice), do: 0

  # Caso recursivo
  def recorrer_diagonal([fila | resto_filas], indice) do
    elemento = obtener_elemento(fila, indice)
    elemento + recorrer_diagonal(resto_filas, indice - 1)
  end

  # Obtener elemento por índice
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

resultado = MatrizRecursiva.recorrer_diagonal(matriz)
IO.puts("Suma diagonal secundaria: #{resultado}")

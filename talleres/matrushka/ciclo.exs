defmodule Matrushka do
  def abrir(), do:
  abrir(1, 5)

  def abrir(n, limite) when n <= limite do
    IO.puts("Abrir matrushka #{n}")
    abrir(n + 1, limite)
    IO.puts("Cerrar matrushka #{n}")
  end

  def abrir(n, limite) when n > limite do
    :ok
  end
end

Matrushka.abrir()

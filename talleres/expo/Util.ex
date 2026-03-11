defmodule Util do

  def pedir_texto(mensaje) do
    IO.gets(mensaje)
    |> String.trim()
  end

  def pedir_numero(mensaje) do
    IO.gets(mensaje)
    |> String.trim()
    |> String.to_integer()
  end

  def mostrar(texto) do
    IO.puts(texto)
  end

end

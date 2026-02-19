defmodule Util do

  def mostrar_mensaje(mensaje) do
    IO.puts(mensaje)
  end

end


def ingresar(mensaje, :entero) do
  mensaje
  |> Util.ingresar(:texto)
  |> String.to_integer()
end

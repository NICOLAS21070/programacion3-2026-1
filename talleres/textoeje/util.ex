defmodule Util do
  def mostrar_mensaje(texto) do
    System.cmd("java", ["Mensaje", texto])
  end
end

defmodule Mensaje do
  def main do
    "Bienvenidos a la empresa Once Ltda"
    |> Util.mostrar_mensaje()
  end
end

Mensaje.main()

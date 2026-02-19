defmodule Util do
  def mostrar_mensaje(texto) do
    System.cmd("java", ["Mensaje", texto])
  end
end

defmodule MensajeElixir do
  def main do
    Util.mostrar_mensaje("Bienvenidos a la empresa Once Ltda")
  end
end

MensajeElixir.main()

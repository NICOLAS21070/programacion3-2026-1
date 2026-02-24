defmodule Util do

  
  def ingresar(mensaje, :texto) do
    mensaje
    |> IO.gets()
    |> String.trim()
    |> String.downcase()
  end



  def ingresar(mensaje, :entero) do
    mensaje
    |> ingresar(:texto)
    |> String.to_integer()
  end



  def convertir_a_booleano(valor) do
    valor == "si"
  end



  def generar_mensaje(nombre) do
    "Bienvenido #{nombre} a la empresa Once Ltda"
  end


  def mostrar_mensaje(mensaje) do
    IO.puts(mensaje)
  end

end

defmodule Util do


  def calcular_valor_descuento(valor_producto, porcentaje_descuento) do
    valor_producto * porcentaje_descuento
  end

  def calcular_valor_final(valor_producto, valor_descuento) do
    valor_producto - valor_descuento
  end

  def generar_mensaje(valor_descuento, valor_final) do
    valor_descuento = Float.round(valor_descuento, 1)
    valor_final = Float.round(valor_final, 1)

    "Valor de descuento de $#{valor_descuento} y el valor final $#{valor_final}"
  end



  # Entrada de texto
  def ingresar(mensaje, :texto) do
    mensaje
    |> IO.gets()
    |> String.trim()
  end

  # Entrada de entero
  def ingresar(mensaje, :entero) do
    ingresar(mensaje, &String.to_integer/1, :entero)
  end

  # Entrada de número real
  def ingresar(mensaje, :real) do
    ingresar(mensaje, &String.to_float/1, :real)
  end

  # Entrada con validación
  def ingresar(mensaje, parser, tipo_dato) do
    try do
      mensaje
      |> ingresar(:texto)
      |> parser.()
    rescue
      ArgumentError ->
        IO.puts("Error, se espera que ingrese un número #{tipo_dato}")
        ingresar(mensaje, parser, tipo_dato)
    end
  end



  def mostrar_mensaje(mensaje) do
    IO.puts(mensaje)
  end

end

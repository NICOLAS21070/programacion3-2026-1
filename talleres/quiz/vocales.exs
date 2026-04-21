defmodule Potencia do
  def es_potencia(1, _b), do: true

  def es_potencia(n, b) when n < b or rem(n, b) != 0, do: false

  def es_potencia(n, b) do
    es_potencia(div(n, b), b)
  end
end
# Ejecutar
Util.iniciar()

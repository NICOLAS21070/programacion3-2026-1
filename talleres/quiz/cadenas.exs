defmodule Cadenas do
  def mas_larga([]), do: ""

  def mas_larga([head | tail]) do
    mas_larga(tail, head)
  end

  # Recursión de cola
  defp mas_larga([], actual_max), do: actual_max

  defp mas_larga([head | tail], actual_max) do
    if String.length(head) > String.length(actual_max) do
      mas_larga(tail, head)
    else
      mas_larga(tail, actual_max)
    end
  end
end


Util.iniciar()

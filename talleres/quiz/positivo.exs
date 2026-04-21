defmodule Numeros do
  # Validación
  def es_reversible(n) when n <= 0, do: false

  def es_reversible(n) do
    invertido = invertir(n, 0)
    suma = n + invertido
    todos_impares?(suma)
  end


  defp invertir(0, acc), do: acc

  defp invertir(n, acc) do
    digito = rem(n, 10)
    invertir(div(n, 10), acc * 10 + digito)
  end

  defp todos_impares?(0), do: true

  defp todos_impares?(n) do
    digito = rem(n, 10)

    if rem(digito, 2) == 0 do
      false
    else
      todos_impares?(div(n, 10))
    end
  end
end
Util.iniciar()

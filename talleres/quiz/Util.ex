defmodule Util do
  def iniciar do
    n =
      IO.gets("Ingrese un número: ")
      |> String.trim()
      |> String.to_integer()

    if Numeros.es_reversible(n) do
      IO.puts("#{n} es reversible")
    else
      IO.puts("#{n} NO es reversible")
    end
  end
end



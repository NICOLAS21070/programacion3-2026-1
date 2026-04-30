defmodule Alarma do
  def iniciar do
    principal = self()

    spawn(fn -> esperar_y_notificar(3000, principal) end)

    receive do
      :alarma ->
        IO.puts("¡Tiempo cumplido!")
    end
  end

  def esperar_y_notificar(ms, pid) do
    :timer.sleep(ms)
    send(pid, :alarma)
  end
end

Alarma.iniciar()

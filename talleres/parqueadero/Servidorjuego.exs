defmodule ServidorJuego do
  def iniciar(capacidad) do
    spawn(fn -> loop(capacidad, [], 0) end)
  end

  # estado: capacidad, cola_espera, jugadores_actuales
  defp loop(capacidad, cola, ocupados) do
    receive do
      {:conectar, pid} ->
        if ocupados < capacidad do
          send(pid, :ok)
          IO.puts("Jugador #{inspect(pid)} entra. Ocupados: #{ocupados + 1}")
          loop(capacidad, cola, ocupados + 1)
        else
          IO.puts("Jugador #{inspect(pid)} en espera...")
          loop(capacidad, cola ++ [pid], ocupados)
        end

      {:desconectar, pid} ->
        IO.puts("Jugador #{inspect(pid)} salió.")

        case cola do
          [siguiente | resto] ->
            send(siguiente, :ok)
            IO.puts("Jugador #{inspect(siguiente)} entra desde la cola.")
            loop(capacidad, resto, ocupados)

          [] ->
            loop(capacidad, cola, ocupados - 1)
        end
    end
  end
end

defmodule Jugador do
  def iniciar(servidor, tiempo) do
    spawn(fn -> conectar(servidor, tiempo) end)
  end

  defp conectar(servidor, tiempo) do
    send(servidor, {:conectar, self()})

    receive do
      :ok ->
        IO.puts("Jugador #{inspect(self())} jugando...")
        Process.sleep(tiempo)
        send(servidor, {:desconectar, self()})
    end
  end
end

# ---------------------------
# Simulación
# ---------------------------

defmodule Simulacion do
  def iniciar do
    servidor = ServidorJuego.iniciar(4)

    # Crear 7 jugadores con tiempos distintos
    for i <- 1..7 do
      Jugador.iniciar(servidor, 3000 + i * 500)
      Process.sleep(500)
    end
  end
end

# Ejecutar
Simulacion.iniciar()  

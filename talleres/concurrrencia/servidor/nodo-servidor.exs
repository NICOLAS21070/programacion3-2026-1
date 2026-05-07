defmodule NodoServidor do

  @nombre_servicio_local :servicio_cadenas

  # =========================
  # MAIN
  # =========================
  def main() do
    Util.mostrar_mensaje("PROCESO SECUNDARIO")

    registrar_servicio(@nombre_servicio_local)

    procesar_mensajes()
  end

  # =========================
  # REGISTRAR SERVICIO
  # =========================
  defp registrar_servicio(nombre_servicio_local),
    do: Process.register(self(), nombre_servicio_local)

  # =========================
  # RECIBIR Y PROCESAR MENSAJES
  # =========================
  defp procesar_mensajes() do
    receive do

      {productor, mensaje} ->

        respuesta = procesar_mensaje(mensaje)

        send(productor, respuesta)

        # Seguir escuchando mientras no llegue :fin
        if respuesta != :fin do
          procesar_mensajes()
        end

    end
  end

  # =========================
  # PROCESAMIENTO DE MENSAJES
  # =========================

  # Finalizar
  defp procesar_mensaje(:fin),
    do: :fin

  # Convertir a mayúsculas
  defp procesar_mensaje({:mayusculas, msg}),
    do: String.upcase(msg)

  # Convertir a minúsculas
  defp procesar_mensaje({:minusculas, msg}),
    do: String.downcase(msg)

  # Ejecutar función
  defp procesar_mensaje({funcion, msg})
       when is_function(funcion, 1),
       do: funcion.(msg)

  # Mensaje desconocido
  defp procesar_mensaje(mensaje),
    do: "El mensaje \"#{mensaje}\" es desconocido."

end

NodoServidor.main()

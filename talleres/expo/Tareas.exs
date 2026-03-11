defmodule GestorTareas do

  def iniciar do
    tareas = []
    menu(tareas)
  end

  def menu(tareas) do
    IO.puts("\n--- GESTOR DE TAREAS ---")
    IO.puts("1. Agregar tarea")
    IO.puts("2. Ver tareas")
    IO.puts("3. Marcar tarea como completada")
    IO.puts("4. Salir")

    opcion =
      IO.gets("Seleccione una opción: ")
      |> String.trim()
      |> String.to_integer()

    case opcion do
      1 ->
        {:ok, nuevas_tareas} = agregar_tarea(tareas)
        menu(nuevas_tareas)

      2 ->
        ver_tareas(tareas)
        menu(tareas)

      3 ->
        {:ok, nuevas_tareas} = completar_tarea(tareas)
        menu(nuevas_tareas)
      4 ->
        IO.puts("Hasta luego!")

      _ ->
        IO.puts("Opción inválida")
        menu(tareas)
    end
  end


def agregar_tarea(tareas) do
  descripcion =
    IO.gets("Ingrese la descripción de la tarea: ")
    |> String.trim()

  id = length(tareas) + 1

  nueva_tarea = %{
    id: id,
    descripcion: descripcion,
    estado: :pendiente
  }

  {:ok, tareas ++ [nueva_tarea]}
end


  def ver_tareas(tareas) do
    Enum.each(tareas, fn tarea ->
      IO.puts("#{tarea.id} - #{tarea.descripcion} (#{tarea.estado})")
    end)
  end


  def completar_tarea(tareas) do
  id =
    IO.gets("Ingrese el ID de la tarea: ")
    |> String.trim()
    |> String.to_integer()

  nuevas_tareas =
    Enum.map(tareas, fn tarea ->
      case tarea.id == id do
        true -> Map.put(tarea, :estado, :completada)
        false -> tarea
      end
    end)

  {:ok, nuevas_tareas}
  end

end
GestorTareas.iniciar()

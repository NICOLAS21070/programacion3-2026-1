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
    IO.puts("4. Eliminar tarea")
    IO.puts("5. Salir")

    opcion =
      IO.gets("Seleccione una opción: ")
      |> String.trim()

    opcion =
      case opcion do
        "" -> 0
        _ -> String.to_integer(opcion)
      end

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
        {:ok, nuevas_tareas} = eliminar_tarea(tareas)
        menu(nuevas_tareas)

      5 ->
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
    if tareas == [] do
      IO.puts("No hay tareas registradas")
    else
      Enum.each(tareas, fn tarea ->
        IO.puts("#{tarea.id} - #{tarea.descripcion} (#{tarea.estado})")
      end)
    end
  end


  def completar_tarea(tareas) do
    id =
      IO.gets("Ingrese el ID de la tarea: ")
      |> String.trim()
      |> String.to_integer()

    nuevas_tareas =
      Enum.map(tareas, fn tarea ->
        if tarea.id == id do
          Map.put(tarea, :estado, :completada)
        else
          tarea
        end
      end)

    {:ok, nuevas_tareas}
  end


  def eliminar_tarea(tareas) do
    id =
      IO.gets("Ingrese el ID de la tarea a eliminar: ")
      |> String.trim()
      |> String.to_integer()

    nuevas_tareas =
      Enum.filter(tareas, fn tarea ->
        tarea.id != id
      end)

    {:ok, nuevas_tareas}
  end

end

GestorTareas.iniciar()

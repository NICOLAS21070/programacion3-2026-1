defmodule Util do
  # =========================
  # ENTRADA / SALIDA
  # =========================
  def mostrar_mensaje(mensaje) do
    IO.puts(mensaje)
  end

  def ingresar(mensaje, :texto) do
    mensaje
    |> IO.gets()
    |> String.trim()
  end

  def ingresar(mensaje, :entero) do
    mensaje
    |> IO.gets()
    |> String.trim()
    |> String.to_integer()
  end

  def ingresar(mensaje, :real) do
    mensaje
    |> IO.gets()
    |> String.trim()
    |> String.to_float()
  end

  def ingresar(mensaje, :boolean) do
    valor =
      mensaje
      |> ingresar(:texto)
      |> String.downcase()

    Enum.member?(["si", "sí", "s"], valor)
  end

  # =========================
  # CRUD BÁSICO PARA LISTAS
  # =========================

  # CREATE
  def crear(lista, elemento) do
    lista ++ [elemento]
  end

  # READ
  def listar(lista) do
    lista
  end

  # UPDATE
  def actualizar(lista, index, nuevo_elemento) do
    List.replace_at(lista, index, nuevo_elemento)
  end

  # DELETE
  def eliminar(lista, index) do
    List.delete_at(lista, index)
  end

  # BUSCAR
  def buscar(lista, funcion) do
    Enum.find(lista, funcion)
  end
end



defmodule PlataformaAcademica do

  def main do
    nombre_usuario =
      "Ingrese su nombre: "
      |> Util.ingresar(:texto)

    edad_usuario =
      "Ingrese la edad: "
      |> Util.ingresar(:entero)

    intentos_fallidos =
      "Ingrese la cantidad de intentos fallidos: "
      |> Util.ingresar(:entero)

    credenciales_validas =
      "Si tiene credenciales escriba 'si', de lo contrario 'no': "
      |> Util.ingresar(:texto)
      |> convertir_a_booleano()

    resultado =
      validar_acceso(nombre_usuario, edad_usuario, credenciales_validas, intentos_fallidos)

    IO.inspect(resultado)
  end



  def convertir_a_booleano(valor) do
    valor == "si"
  end



  def validar_acceso(nombre, edad, credenciales_validas, intentos_fallidos) do

    unless credenciales_validas do
      {:error, "Acceso denegado: credenciales inválidas"}

    else
      if intentos_fallidos >= 3 do
        {:error, "Cuenta bloqueada por múltiples intentos fallidos"}

      else
        if edad < 18 do
          {:error, "Acceso restringido: usuario menor de edad"}

        else
          {:ok, "Acceso concedido, #{nombre}"}
        end
      end
    end

  end

end



PlataformaAcademica.main()

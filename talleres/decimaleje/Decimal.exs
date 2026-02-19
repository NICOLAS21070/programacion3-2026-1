defmodule EntradaReales do

  def main do
    valor_producto =
      Util.ingresar("Ingrese el valor del producto: ", :entero)

    porcentaje_descuento =
      Util.ingresar("Ingrese el porcentaje de descuento: ", :real)

    valor_descuento =
      Util.calcular_valor_descuento(valor_producto, porcentaje_descuento)

    valor_final =
      Util.calcular_valor_final(valor_producto, valor_descuento)

    Util.generar_mensaje(valor_descuento, valor_final)
    |> Util.mostrar_mensaje()
  end

end

# Ejecuta el programa
EntradaReales.main()

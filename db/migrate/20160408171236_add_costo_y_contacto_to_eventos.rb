class AddCostoYContactoToEventos < ActiveRecord::Migration
  def change
    add_column :eventos, :costo, :int
    add_column :eventos, :contacto, :string
  end
end

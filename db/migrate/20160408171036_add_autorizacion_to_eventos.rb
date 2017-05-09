class AddAutorizacionToEventos < ActiveRecord::Migration
  def change
    add_column :eventos, :autorizado, :boolean
  end
end

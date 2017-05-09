class AddFechasToEventos < ActiveRecord::Migration
  def change
    add_column :eventos, :fechaInic, :date
    add_column :eventos, :fechaFin, :date
  end
end

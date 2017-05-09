class AddCategoriesToEventos < ActiveRecord::Migration
  def change
    add_column :eventos, :categorias, :string
  end
end

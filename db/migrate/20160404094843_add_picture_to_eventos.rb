class AddPictureToEventos < ActiveRecord::Migration
  def change
    add_column :eventos, :picture, :string
  end
end

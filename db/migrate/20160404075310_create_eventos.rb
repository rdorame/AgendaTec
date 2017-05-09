class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|
      t.text :nombre_evento
      t.text :descripcion
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
     add_index :eventos, [:user_id, :created_at]
  end
end

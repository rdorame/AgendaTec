class AddIndexToUsersMatricula < ActiveRecord::Migration
  def change
  	add_index :users, :matricula, unique: true
  end
end

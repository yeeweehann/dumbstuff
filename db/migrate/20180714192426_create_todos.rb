class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      	t.string :description
      	t.integer :status, default: 0
      	t.references :user
      	t.timestamps
    end
  end
end

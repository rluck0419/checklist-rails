class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.belongs_to :list, foreign_key: true
      t.boolean :completed
      t.text :body
      t.integer :position

      t.timestamps
    end
  end
end

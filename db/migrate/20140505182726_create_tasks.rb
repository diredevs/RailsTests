class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.date :date
      t.boolean :done, default: false

      t.references :list

      t.timestamps
    end
  end
end

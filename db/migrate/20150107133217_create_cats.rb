class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :name
      t.string :color
      t.string :sex
      t.string :breeder
      t.string :owner

      t.timestamps null: false
    end
  end
end

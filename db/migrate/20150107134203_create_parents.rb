class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.references :cat, index: true
      t.references :cat, index: true, column: :father_id
      t.references :cat, index: true, column: :mother_id

      t.timestamps null: false
    end
    add_column :parents, :father_id, :integer
    add_column :parents, :mother_id, :integer
#    add_foreign_key :parents, :cats
    add_foreign_key :parents, :cats, column: :father_id, primary_key: :id
    add_foreign_key :parents, :cats, column: :mother_id, primary_key: :id
  end
end

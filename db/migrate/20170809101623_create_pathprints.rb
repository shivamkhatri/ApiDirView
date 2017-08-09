class CreatePathprints < ActiveRecord::Migration[5.1]
  def change
    create_table :pathprints do |t|
      t.string :name
      t.string :path
      t.string :path_type
      t.string :owner
      t.references :pathprint, foreign_key: true
      t.timestamps
    end
  end
end

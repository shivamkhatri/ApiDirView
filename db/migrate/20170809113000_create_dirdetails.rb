class CreateDirdetails < ActiveRecord::Migration[5.1]
  def change
    create_table :dirdetails do |t|
      t.string :name
      t.string :path
      t.string :owner
      t.string :ptype
      t.string :parent
    
      t.timestamps
    end
  end
end

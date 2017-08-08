class CreateFiledetails < ActiveRecord::Migration[5.1]
  def change
    create_table :filedetails do |t|
      t.string :name
      t.string :path
      t.string :owner
      t.string :ptype

      t.timestamps
    end
  end
end

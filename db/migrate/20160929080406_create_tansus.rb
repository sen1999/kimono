class CreateTansus < ActiveRecord::Migration
  def change
    create_table :tansus do |t|
      t.text      :memo
      t.string    :image
      t.timestamps null: false
    end
  end
end

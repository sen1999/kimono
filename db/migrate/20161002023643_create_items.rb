class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text      :memo
      t.timestamps null: false
    end
  end
end

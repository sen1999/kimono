class CreateBelts < ActiveRecord::Migration
  def change
    create_table :belts do |t|

      t.timestamps null: false
    end
  end
end

class CreateCollars < ActiveRecord::Migration
  def change
    create_table :collars do |t|

      t.timestamps null: false
    end
  end
end

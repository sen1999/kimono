class CreateKimonos < ActiveRecord::Migration
  def change
    create_table :kimonos do |t|

      t.timestamps null: false
    end
  end
end

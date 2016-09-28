class CreateKimonos < ActiveRecord::Migration
  def change
    create_table :kimonos do |t|
      t.text      :title
      t.timestamps null: false
    end
  end
end

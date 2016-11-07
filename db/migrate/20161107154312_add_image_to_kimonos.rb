class AddImageToKimonos < ActiveRecord::Migration
  def change
    add_column :kimonos, :image, :string
  end
end

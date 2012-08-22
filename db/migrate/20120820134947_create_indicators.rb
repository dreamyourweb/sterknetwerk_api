class CreateIndicators < ActiveRecord::Migration
  def change
    create_table :indicators do |t|
      t.string :title
      t.text :description
      t.text :example
      t.string :score
      t.integer :aspect_id
      t.string :image_name
      t.integer :threshold

      t.timestamps
    end
  end
end

class CreateAspects < ActiveRecord::Migration
  def change
    create_table :aspects do |t|
      t.string :title
      t.integer :score
      t.string :answer_type

      t.timestamps
    end
  end
end

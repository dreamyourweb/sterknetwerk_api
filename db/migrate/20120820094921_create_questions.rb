class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.string :answers, array: true    
      t.integer :answer_scores, array: true
      t.string :answer_type
      t.integer :score
      t.integer :indicator_id
      t.integer :aspect_id
      t.integer :factor

      t.timestamps
    end
  end
end

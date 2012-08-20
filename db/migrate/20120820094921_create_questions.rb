class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.string :answers, array: true    
      t.integer :answer_scores, array: true
      t.string :answer_type
      t.integer :score
      t.integer :indicator
      t.integer :factor

      t.timestamps
    end
  end
end

class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :results_id
      t.integer :question_id
      t.string :value

      t.timestamps
    end
  end
end

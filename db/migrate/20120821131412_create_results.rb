class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :email
      t.string :company_name
      t.string :contact_name
      t.string :tel
      t.string :cc
      t.string :bcc

      t.timestamps
    end
  end
end

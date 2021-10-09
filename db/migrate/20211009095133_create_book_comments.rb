class CreateBookComments < ActiveRecord::Migration[5.2]
  def change
    create_table :book_comments do |t|
      t.string :comment
      t.integer :user_id
      t.integer :book_id

      t.timestamps
    end
  end
end

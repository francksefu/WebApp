class AddRefToComments < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :comments, :users, column: :user_id
    add_foreign_key :comments, :posts, column: :posts_id
  end
end

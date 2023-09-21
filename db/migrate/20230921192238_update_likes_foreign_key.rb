class UpdateLikesForeignKey < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :likes, :users  
    rename_column :likes, :author_id, :user_id
    add_foreign_key :likes, :users, column: :user_id
  end
end

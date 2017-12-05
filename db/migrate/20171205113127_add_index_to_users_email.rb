class AddIndexToUsersEmail < ActiveRecord::Migration[5.1]
  def change
		#unique true makes the column unique in the table
		add_index	:users, :email, unique: true
  end
end

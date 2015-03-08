class CreateFriendUsers < ActiveRecord::Migration
  def change
    create_table :friend_users do |t|
#     	# friend_users.friend_id
#     	add_foreign_key :users, :users, column: :friend_id, primary_key: :ujhhh
    end
  end
end


# create_table :word_synonyms do |t|
#   t.integer :word_id
#   t.integer :synonym_id
# end
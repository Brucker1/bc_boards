class User < ActiveRecord::Base 
	has_and_belongs_to_many :friends, class_name: "User", 
                                     join_table: "friend_users",
                                     association_foreign_key: "friend_id"

    belongs_to :messages
    has_and_belongs_to_many :events
    has_and_belongs_to_many :groups
end

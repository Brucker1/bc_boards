class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string 	 :picture_url
    	t.string	 :first_name
    	t.string	 :last_name
    	t.string 	 :location 
    	t.string	 :positions
    	t.string 	 :headline
    	t.references :messages
    	t.references :groups
    	t.references :articles
    	t.references :events
    end
  end
end

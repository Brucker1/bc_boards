class UsersController < ApplicationController 
	
	def index 
		response = HTTParty.get(
    	 "https://api.linkedin.com/v1/people/~:(id,picture-url,first-name,last-name,location,positions,headline,three-past-positions)?format=json",
        :headers => {
          "Authorization" => "Bearer #{session[:access_token]}"
        	}
      	)
		session[:user_id] = response['id']
		# @position_summary_list = response['positions']['values'].map do |value|
		# 	value['summary']
		# end

		@user = User.create(
			:id  		  => response['id'],
			:first_name   => response['firstName'], 
			:last_name    => response['lastName'],
			:location     => response['location']['name'], 
			:picture_url  => response['pictureUrl'], 
			:positions    => @position_summary_list,
			:headline     => response['headline'],
			:home_visits   => 0
		)

		
			user = User.find session[:user_id]

			# if user.home_visits > 0
			# 	redirect_to '/home'
			# else redirect_to '/questionnaire'

	end 

	def create
		# response = HTTParty.get(
  #   	 "https://api.linkedin.com/v1/people/~:(id,picture-url,first-name,last-name,location,positions,headline,three-past-positions)?format=json",
  #       :headers => {
  #         "Authorization" => "Bearer #{session[:access_token]}"
  #       	}
  #     	)
		# session[:user_id] = response['id']
		# position_summary_list = response['positions']['values'].map do |value|
		# 	value['summary']
		# end

		# @user = User.create(
		# 	:first_name   => response['firstName'], 
		# 	:last_name    => response['lastName'],
		# 	:location     => response['location']['name'], 
		# 	:picture_url  => response['pictureUrl'], 
		# 	:positions    => position_summary_list,
		# 	:headline     => response['headline'],
		# 	:home_visits   => 0, 
		# )

		#   binding.pry
		# 	user = User.find params[:id]
		# 	if user.home_visits > 0
		# 		redirect_to '/home'
		# 	else redirect_to '/questionnaire'
		# 	end 

	end

	# def show
	# 	user = User.find params[:id]
	# 	if user.home_visits > 0
	# 		redirect_to '/home'
	# 	else '/questionnaire'
	# 	end 

	# end 

	def show

	end

	def questionnaire

		# @user = User.find_by :user_id

	end 
	
	def update
		user = User.find params[:id]
		user.home_visits += 1
		user.update
	end
end 
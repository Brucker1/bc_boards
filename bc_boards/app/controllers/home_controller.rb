class HomeController < ApplicationController
	def index
		response = HTTParty.get(
        "https://api.linkedin.com/v1/people/~:(id,picture-url,first-name,last-name,location,positions,headline,three-past-positions)?format=json",
        :headers => {
          "Authorization" => "Bearer #{session[:access_token]}"
        }
      )
	@user = User.create(
		:first_name   => response['firstName'], 
		:last_name    => response['lastName'],
		:location     => response['location']['name'], 
		:picture_url  => response['pictureUrl'], 
		:positions    => response['positions']['values'].each { |value| value['summary'] },
		:headline     => response['headline'],
		:home_visits   => 1
	)



	end 
end 
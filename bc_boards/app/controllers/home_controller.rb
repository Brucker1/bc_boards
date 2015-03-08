class HomeController < ApplicationController
	def index
		response = HTTParty.get(
        "https://api.linkedin.com/v1/people/~:(id,picture-url,first-name,last-name,location,positions,headline,three-past-positions)?format=json",
        :headers => {
          "Authorization" => "Bearer #{session[:access_token]}"
        }
      )


	end 
end 
class SessionController < ApplicationController  
	def create 
		response = HTTParty.post(
        "https://www.linkedin.com/uas/oauth2/accessToken",
        :body => {
          :grant_type     => "authorization_code",
          :code           => params[:code],
          :redirect_uri   => "http://localhost:3000/linkedin/oauth_callback",
          :client_id      => ENV["Linkedin_Oauth_API_Key"],
          :client_secret  => ENV["Linkedin_Oauth_Secret_Key"]
        },
        :headers => {
          "Accept"        => "application/json"
        }
      )
  
      # save the access token for whenever we need it!
      session[:access_token] = response["access_token"]
      
      redirect_to '/users' 

	end 

	def destroy
		session[:access_token] = nil
		redirect_to '/'
	end 
	
end 
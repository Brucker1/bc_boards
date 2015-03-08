class WelcomeController < ApplicationController 
	def index
		query_params = URI.encode_www_form({
        :response_type => "code",
        :client_id     => ENV["Linkedin_Oauth_API_Key"],
        :state         => "D8DCWLC327HVM",
        :redirect_uri  => "http://localhost:3000/linkedin/oauth_callback"
      })
      @linkedin_auth_url = "https://www.linkedin.com/uas/oauth2/authorization?" + query_params 
    end 
end 

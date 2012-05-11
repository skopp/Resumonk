class AuthController < ApplicationController
  def index
      # get your api keys at https://www.linkedin.com/secure/developer
      client = LinkedIn::Client.new("fbfwjf0k7q4q", "JKsukdw1shrQvDZy")
      request_token = client.request_token(:oauth_callback => 
                                        "http://#{request.host_with_port}#{new_user_resume_path(current_user)}")
      session[:rtoken] = request_token.token
      session[:rsecret] = request_token.secret

      redirect_to client.request_token.authorize_url

  end

  def callback
    client = LinkedIn::Client.new("fbfwjf0k7q4q", "JKsukdw1shrQvDZy")
    if session[:atoken].nil?
      pin = params[:oauth_verifier]
      atoken, asecret = client.authorize_from_request(session[:rtoken], session[:rsecret], pin)
      session[:rtoken] = atoken
      session[:rsecret] = asecret
    else
      client.authorize_from_access(session[:atoken], session[:asecret])
    end
    @profile = client.profile(:fields => %w(positions))
    @connections = client.connections
    redirect_to(:back)
  end

end

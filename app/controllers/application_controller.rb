require './config/environment'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
   # set :session_secret "secret"
  end

  get '/' do
    erb :index
  end

  helpers do
    def logged_in?
      !!current_user #!!session[:email]
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
  end

  # def login(email)
  #   session[:email] = email
  # end

  # def logout!
  #   session.clear
  # end
end
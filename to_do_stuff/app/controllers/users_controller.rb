class UsersController < ApplicationController
    
    
    get '/signup' do
        erb :'users/signup'
    end

  post '/signup' do
    if params[:username] == "" || params[:password] == ""
      redirect '/signup'
    else
      User.create(username: params[:username], password: params[:password])
      redirect '/login'
    end

  end

  get '/account' do
    @user = User.find(session[:user_id])
    @things = @user.things
    erb :'users/account'
  end


  get '/login' do
    erb :'users/login'
  end

  post '/login' do
    user = User.find_by(:username => params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/account'
    else
      redirect '/sorry'
    end

  end

    get "/logout" do
        session.clear
        redirect "/"
  end
end
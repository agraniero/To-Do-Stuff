class ThingsController < ApplicationController

    get '/things/new' do
      redirect_if_not_logged_in
      erb :'/things/new'
    end

    post '/things/new' do
      @thing = Thing.create(:description => params[:description], :user_id => session[:user_id])
      redirect to "/things/#{@thing.id}"
    end

    get '/things/:id' do
      @thing = Thing.find_by_id(params[:id])
      erb :'/things/show'   
    end

    get '/things/:id/edit' do
      redirect_if_not_logged_in
      @thing = Thing.find_by_id(params[:id])
      erb :'/things/edit'
    end 

    patch '/things/:id/edit' do 
      @thing = Thing.find_by_id(params[:id])
      @thing.description = params[:description]
      @thing.save
      redirect to "/things/#{@thing.id}"
    end
    
    get '/things/:id/delete' do 
      redirect_if_not_logged_in
      @thing = Thing.find_by_id(params[:id])
      erb :'/things/delete'
    end

    delete '/things/:id/delete' do 
      @thing = Thing.find_by_id(params[:id])
      @thing.destroy
      redirect to '/account'
    end
end
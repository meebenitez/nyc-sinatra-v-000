class LandmarksController < ApplicationController

  get '/' do
      erb :index
    end

    get '/landmarks/new' do
      erb :'landmarks/new'
    end



    get '/landmarks' do
      @landmarks = Landmark.all
      erb :'landmarks/index'
    end

    post '/landmarks' do
      @landmark = Landmark.create(params[:landmark])
      @landmark.save

      redirect to("/landmarks/#{@landmark.id}")
    end

    get '/landmarks/:id' do
      @landmark = Landmark.find(params[:id])
      erb :'/landmarks/show'
    end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    #binding.pry
    erb :'/landmarks/edit'
  end

  post '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.update(params[:landmark])
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    #binding.pry
    @figure.save

    redirect to("/figures/#{@figure.id}")


    end


end

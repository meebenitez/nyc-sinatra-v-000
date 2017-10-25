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

    get '/figures/:id' do
      @figure = Figure.find(params[:id])
      erb :'/figures/show'
    end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    #binding.pry
    erb :'/figures/edit'
  end

  post '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])
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

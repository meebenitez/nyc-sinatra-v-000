class FiguresController < ApplicationController


  get '/' do
      erb :index
    end

    get '/figures/new' do
      erb :'figures/new'
    end



    get '/figures' do
      @figures = Figure.all
      erb :'figures/index'
    end

    post '/figures' do
      @figure = Figure.create(params[:figure])
      #binding.pry
      #binding.pry
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


#require 'rack-flash'
class ApplicationController < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets
  configure do
    enable :sessions
    set :session_secret, "secret"
    #use Rack::Flash
  end

  get '/' do
    erb :index
  end
end

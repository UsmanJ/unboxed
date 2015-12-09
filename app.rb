require 'sinatra/base'

class Unboxed < Sinatra::Base

  get '/' do
    erb :'index'
  end

  run! if app_file == Unboxed
end

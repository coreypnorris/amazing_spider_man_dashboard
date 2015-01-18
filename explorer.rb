require 'sinatra'
require 'sinatra/base'

class Explorer < Sinatra::Base
  helpers do

  end

  get '/' do
    erb :main
  end
end

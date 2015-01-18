require 'sinatra'
require 'sinatra/base'
require 'dashing'
require 'dashing-contrib'
require './explorer'

DashingContrib.configure

configure do
  set :auth_token, ENV['AUTH_TOKEN']
  set :marvel_public_key, ENV['MARVEL_PUBLIC_KEY']
  set :marvel_private_key, ENV['MARVEL_PRIVATE_KEY']

  helpers do
    def protected!
     # Put any authentication code you want in here.
     # This method is run before accessing any resource.
    end
  end

  get '/' do
    erb :main
  end
end

map Sinatra::Application.assets_prefix do
  run Sinatra::Application.sprockets
end

run Sinatra::Application
run Rack::URLMap.new('/' => Sinatra::Application, '/explorer' => Explorer.new)

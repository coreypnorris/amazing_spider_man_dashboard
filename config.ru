require 'sinatra'
require 'sinatra/base'
require 'dashing'
require 'dashing-contrib'
require 'pry'

DashingContrib.configure

configure do
  helpers do
    def protected!
     # Put any authentication code you want in here.
     # This method is run before accessing any resource.
    end
  end
end

map Sinatra::Application.assets_prefix do
  run Sinatra::Application.sprockets
end

run Sinatra::Application

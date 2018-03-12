require 'json'
require 'sinatra'
require 'sinatra/activerecord'

require './config/database'

# load Models
Dir["./app/models/*.rb"].each { |file| require file }

class App < Sinatra::Base
  get '/' do
    'hello word'
  end
end

require 'bundler'
require 'net/http'
require 'json'
Bundler.require
require_relative './models/model.rb'

class MyApp < Sinatra::Base

 @output = "'daniel'"
  
  get '/' do
    erb :index
  end
  
  post '/result' do
    @input = params[:input].to_f
    @unitin = params[:unitin].to_f
    @unitout = params[:unitout].to_f
    @output = value(@input)
    
    url = "http://api.giphy.com/v1/stickers/random?api_key=dc6zaTOxFJmzC"
            resp = Net::HTTP.get_response(URI.parse(url))
            buffer = resp.body
            result = JSON.parse(buffer) 
            @gif = result["data"]["image_url"]

    erb :result
  end
  


end
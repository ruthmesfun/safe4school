require 'bundler'
Bundler.require
require_relative 'models/model.rb'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index
  end
  
  post '/analyze' do
    @artist = params[:artist].gsub(" ", "_")
    @song = params[:song].gsub(" ", "_")
  #Connect to the API
    raw_api_data = open("http://lyrics.wikia.com/api.php?artist=#{@artist}&song=#{@song}&fmt=realjson").read
 
  #Convert them to jason
    json_data_hash = JSON.parse(raw_api_data)

  #pulls down lyrics
    @lyrics_string = json_data_hash["lyrics"]
    erb:analyze
  end

end

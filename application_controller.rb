require 'bundler'
Bundler.require
require_relative 'models/model.rb'

class ApplicationController < Sinatra::Base

  get '/' do
    erb:index
  end
  
  post '/solution' do
    @artist = params[:artist].gsub(" ", "_")
    @song = params[:song].gsub(" ", "_")
    @dirty_words = params[:dirty_words].split(" ")
  #Connect to the API
    raw_api_data = open("http://lyrics.wikia.com/api.php?artist=#{@artist}&song=#{@song}&fmt=realjson").read
 
  #Convert them to jason
    json_data_hash = JSON.parse(raw_api_data)

  #pulls down lyrics
    @lyrics = json_data_hash["lyrics"]
    if @lyrics != "Not found"
      @dirty_count = dirty_word_counter(@lyrics, @dirty_words)
    else
      @dirty_count = "Not Found"
    end
    
    
  #Route to solution.erb
    erb:solution
  end

end

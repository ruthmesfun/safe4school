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
#   #Connect to the API
#     raw_api_data = open("http://lyrics.wikia.com/api.php?artist=#{@artist}&song=#{@song}&fmt=realjson").read
 
#   #Convert them to jason
#     json_data_hash = JSON.parse(raw_api_data)

#   #pulls down lyrics
#     @lyrics = json_data_hash["lyrics"]
    
#     *****Pulling lyrics down using Lyricfy gem*********
    
    #creates a new instance of the Fetcher class that allows for searching for lyrics
    fetcher = Lyricfy::Fetcher.new
    
    #fetcher.search will return an Lyricfy::Song object.  One of the Song methods is "lines" which returns all the lyrics of the song in the form of an array.  Other Song methods include #title #author and #body.
    @lyrics = fetcher.search @artist, @song
    if @lyrics != nil
      @dirty_count = dirty_word_counter(@lyrics.lines.join(" "), @dirty_words)
      @user_respone = "There are #{@dirty_count} dirty words in this song!"
    else
      @user_respone = "The song you selected could not be found. Please ensure all spelling is correct and try again."
    end
    
    
  #Route to solution.erb
    erb:solution
  end

end

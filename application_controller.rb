require 'bundler'
Bundler.require

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index
  end
  
  #Connect to the API
  raw_api_data = open("http://lyrics.wikia.com/api.php?artist=Lil_Wayne&song=Fireman&fmt=realjson").read
 
  #Convert them to jason
  json_data_hash = JSON.parse(raw_api_data)

  #
  lyrics_string = json_data_hash["lyrics"]
  puts lyrics_string

end

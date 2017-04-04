require 'sinatra/base'
require_relative 'models/link'

class BookmarkManager < Sinatra::Base

  get '/links' do # The path / url.
    @links = Link.all # Set instance variable to Link all.
    erb :'links/index' # Reference the file.
  end
end

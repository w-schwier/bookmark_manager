require 'sinatra/base'
require_relative 'models/link'

class BookmarkManager < Sinatra::Base
  ENV['RACK_ENV'] ||= "development"

  get '/links' do # The path / url.
    @links = Link.all # Set instance variable to Link all.
    erb :'links/index' # Reference the file.
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    Link.create(url: params[:url], title: params[:title])
    redirect '/links'
  end

end

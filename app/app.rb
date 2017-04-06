ENV['RACK_ENV'] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

  get '/links' do # The path / url.
    @links = Link.all # Set instance variable to Link all.
    erb :'links/index' # Reference the file.
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    tag = Tag.first_or_create(name: params[:tags])
    link.tags << tag
    link.save
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  post '/set_filter' do
    redirect "/tags/#{(params[:filter]).to_sym}"
  end

end

ENV['RACK_ENV'] ||= "development"
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base
  register Sinatra::Flash
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'top secret data'

  get '/' do
    erb :home
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/create_user' do
    @user = User.create(email: params[:email], password: params[:password], confirm_password: params[:confirm_password])
    if @user.save
      session[:user_id] = @user.id
      redirect '/links'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/links' do # The path / url.
    @links = Link.all # Set instance variable to Link all.
    erb :'links/index' # Reference the file.
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    tag_names = params[:tags].split(', ')
    tag_names.each do |tag_name|
      link.tags << Tag.first_or_create(name: tag_name)
    end
    link.save
    redirect '/links'
  end

  get '/tags/' do
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  post '/set_filter' do
    correct_search = params[:filter].gsub(' ','%20')
    redirect "/tags/#{correct_search.to_sym}"
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/links'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Goodbye'
    redirect '/'
  end

  helpers do
    def current_user
       @current_user ||= User.get(session[:user_id])
    end
  end

end

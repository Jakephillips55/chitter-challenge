require 'sinatra/base'
require './lib/chitter'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end
# todo
# setup database make status updates display on page

  get '/chitter' do
    @peep = ChitterControl.all

    # 'Hello'
    # ChitterControl.create(status: status)
    # redirect('/')
    erb :chitter
  end

  get '/chitter/new' do
    erb :"chitter/new"
  end 

  post '/chitter' do
    Bookmark.create(peep: params[:peep])
    redirect 'chitter'
  end

  enable :sessions

  run! if app_file == $0
end

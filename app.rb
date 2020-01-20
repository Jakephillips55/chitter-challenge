require 'sinatra/base'
require './lib/chitter'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end
# todo
# setup database make status updates display on page

  get '/log_in' do
    erb :log_in
  end

  post '/log_in' do
    redirect('/chitter') if ChitterControl.secure(params[:email], params[:password])
    redirect('/log_in') if not ChitterControl.secure(params[:email], params[:password])
  end

  get '/chitter' do
    @peeps = ChitterControl.all

    # 'Hello'
    # ChitterControl.create(status: status)
    # redirect('/')
    erb :chitter
  end

  get '/chitter/new' do
    erb :"chitter/new"
  end

  post '/chitter' do
    ChitterControl.create(peep: params[:status])
    redirect 'chitter'
  end

  enable :sessions

  run! if app_file == $0
end

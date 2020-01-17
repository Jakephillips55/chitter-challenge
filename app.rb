require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    'Welcome to Chitter'
  end
#todo
#setup database make status updates display on page

  get '/chitter' do
    '-'
    erb :chitter
  end

  run! if app_file == $0
end

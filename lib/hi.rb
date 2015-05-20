require 'sinatra'

set :port, 8080

get '/' do
	"Hello Base!"
end

get '/hi' do
  "Hello World!"
end
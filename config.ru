require 'Sinatra'
require 'Sinatra/reloader' if development?
require_relative './controllers/clubs_controller.rb'
require_relative './models/club.rb'
require 'pg'


use Rack::MethodOverride
run ClubsController
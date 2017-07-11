require 'Sinatra'
require 'Sinatra/reloader' if development?
require_relative 'controllers/clubs_controller.rb'


use Rack::MethodOverride
run ClubsController
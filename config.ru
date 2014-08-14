require 'bundler'

Bundler.require

require './app/models/Route'
require './app/Base.rb'

['/', '/route'].each do |r|
  map(r) do
    run RoutesControllers::Routes
  end
end

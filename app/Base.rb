require 'sinatra'
require 'json'

module RoutesControllers

  class Routes < Sinatra::Base

    configure do
      set :site_name, 'Krok Climb'
    end

    get '/' do

      data = {
        routes: Route.data
      }

      erb :'routes/list', :layout => :layout, :locals => data
    end

    get '/new' do

      erb :'routes/form', :layout => :layout

    end

    get '/edit/:id' do |id|

      id = id.to_i

      data = {
        id: id,
        route: Route.data[id]
      }

      erb :'routes/form', :layout => :layout, :locals => data
    end



    get '/:id' do |id|

      id = id.to_i

      data = {
        id: id,
        route: Route.data[id]
      }

      erb :'routes/view', :layout => :layout, :locals => data
    end

  end
end

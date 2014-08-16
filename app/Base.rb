require 'sinatra'
require 'json'

module RoutesControllers

  class Routes < Sinatra::Base

    #DataMapper.setup(:default, "sqlite:///#{Dir.pwd}/routes.sqlite")
    #DataMapper.setup(:default, 'postgres://user:password@hostname/database')
    DataMapper.setup(:default, ENV['DATABASE_URL'] || 'postgres://localhost:15432/routes_development')

    configure do
      set :site_name, 'Krok Climb'
    end

    get '/' do
      data = {
        routes: Route.all
      }

      erb :'routes/list', :layout => :layout, :locals => data
    end

    get '/new' do
      erb :'routes/form', :layout => :layout
    end

    post '/new' do

      route = Route.create(
        :name => params['name'],
        :rating => params['rating'],
        :setter => params['setter'],
        :primary_color => params['primary_color'],
        :secondary_color => params['secondary_color'],
        :date_set => params['date']
      )

      redirect('/route')
    end

    get '/edit/:id' do |id|
      id = id.to_i

      data = {
        id: id,
        route: Route.get(id)
      }

      erb :'routes/form', :layout => :layout, :locals => data
    end



    get '/:id' do |id|
      id = id.to_i

      data = {
        id: id,
        route: Route.get(id)
      }

      erb :'routes/view', :layout => :layout, :locals => data
    end

  end
end

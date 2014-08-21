require 'sinatra'
require 'json'

module RoutesControllers

  class Routes < Sinatra::Base

    configure do
      set :site_name, 'Krok Climb'
    end

    get '/' do
      data = {
        oldRoutes: Route.all(:date_set.lt => (DateTime.now - (4 * 30))),
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
        :card_type => params['card_type'],
        :date_set => params['date']
      )

      redirect('/route')
    end

    post '/edit/:id' do |id|

      route = Route.get(id)
      route.update(
        :name => params['name'],
        :rating => params['rating'],
        :setter => params['setter'],
        :primary_color => params['primary_color'],
        :secondary_color => params['secondary_color'],
        :card_type => params['card_type'],
        :date_set => params['date']
      )

      redirect("/route/view/#{id}")
    end

    get '/edit/:id' do |id|
      id = id.to_i

      data = {
        id: id,
        route: Route.get(id)
      }

      erb :'routes/form', :layout => :layout, :locals => data
    end



    get '/view/:id' do |id|
      id = id.to_i

      route = Route.get(id)

      data = {
        id: id,
        route: route,
        card: erb(
          :"routes/card-#{route.card_type}",
          :layout => nil,
          :locals => {
            route: route
          }
        )
      }

      erb :'routes/view', :layout => :layout, :locals => data
    end

    get '/card/:id' do |id|
      id = id.to_i

      route = Route.get(id)

      erb(
        :"routes/card-#{route.card_type}",
        :layout => nil,
        :locals => {
          route: route
        }
      )
    end

  end
end

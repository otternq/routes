require 'rubygems'
require 'dm-core'

DataMapper.setup(:default, ENV['DATABASE_URL'] || 'postgres://localhost/mydb')

class Route

  include DataMapper::Resource

  property :id, Serial

  property :name,            String
  property :setter,          String
  property :rating,          String
  property :primary_color,   String
  property :secondary_color, String
  property :date_set,        DateTime

  def rating_style
    "background-color: #{@primary_color}; border-color: #{secondary_color};"
  end

end

# Perform basic sanity checks and initialize all relationships
# Call this when you've defined all your models
DataMapper.finalize

# automatically create the Route table
Route.auto_upgrade!

require 'rubygems'
require 'dm-core'

DataMapper.setup(:default, ENV['DATABASE_URL'] || 'postgres://localhost:15432/routes_development')

class Route

  include DataMapper::Resource

  property :id, Serial

  property :name,            String
  property :setter,          String
  property :rating,          String
  property :primary_color,   String
  property :card_type,       String, :default  => "block"
  property :secondary_color, String
  property :date_set,        DateTime

  def rating_style
    style = "background-color: #{@primary_color}; border-color: "

    if @secondary_color.empty?
      style << "#{@primary_color};"
    else
      style << "#{@secondary_color};"
    end

    return style
  end

  def card_type
    return @card_type unless @card_type.nil? || @card_type.empty?
    "block"
  end

  def secondary_color
    return @secondary_color unless @secondary_color.empty?
    @primary_color
  end

  def card_outer_style
    return "background-color: #{secondary_color};" + card_inner_style if card_type == "stripe"
    return "background-color: #{@primary_color};" if card_type == "block"
  end

  def card_side_style
    return "background-color: #{secondary_color}; border-color: #{@primary_color}"
  end

  def card_inner_style
    return "border-color: #{@primary_color};" if card_type == "stripe"
    return "background-color: #{secondary_color};" if card_type == "block"
  end

end

# Perform basic sanity checks and initialize all relationships
# Call this when you've defined all your models
DataMapper.finalize

# automatically create the Route table
Route.auto_upgrade!

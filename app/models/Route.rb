class Route
  attr_accessor :name, :setter, :rating, :primary_color, :date_set
  attr_writer :secondary_color

  def initialize(name, rating, setter, primary_color, secondary_color=nil)
    @name = name
    @setter = setter
    @rating = rating
    @primary_color = primary_color
    @secondary_color = secondary_color

    @date_set = DateTime.now
  end

  def initials
    ini = []

    @setter.split do |name|
      ini << name.first
    end

    ini
  end

  def secondary_color
    return @primary_color if @secondary_color.nil?
    @secondary_color
  end

  def rating_style
    "background-color: #{@primary_color}; border-color: #{secondary_color};"
  end

  def self.data
    [
      Route.new('blue', '5.10d', 'Mr. White', 'white', 'blue'),
      Route.new('dr. cook', '5.10a', 'Jessie', 'green', 'yellow'),
      Route.new('the deal', '5.8', 'Saul Goodman', 'brown'),
      Route.new('The Imaginarium of Doctor Parnassus', 'V4', 'Heath Ledger', 'purple')
    ]
  end

end

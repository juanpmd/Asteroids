include Math

class Asteroid
  #--------------------------------------#
  def initialize(window)
    @window = window
    @alive = true
    @image = Gosu::Image.new(window, "assets/Large_Asteroid.png", false)
    @x, @y, @angle = rand(1000), rand(350), rand(360)
    @speed_modifier = 1
  end
  #--------------------------------------#
  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end
  #--------------------------------------#
  def move
    @x += @speed_modifier*Math.sin(Math::PI/180*@angle)
    @y += -@speed_modifier*Math.cos(Math::PI/180*@angle)
    @x %= 640
    @y %= 480
  end
  #--------------------------------------#
  def setup(x, y, speed)
    @x, @y, @speed_modifier = x, y, speed
    @angle = rand(360)
    self
  end
  #--------------------------------------#
  def self.spawn(window, count)
    count.times.collect{Asteroid.new(window)}
  end
  #--------------------------------------#
end

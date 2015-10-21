class Projectile
  #--------------------------------------#
  def initialize(origin_object)
    @alive = true
    @x, @y = origin_object.x, origin_object.y
    @angle = origin_object.angle
    @speed_modifier = 7
    @image = Gosu::Image.new('assets/projectile.png')
    @distance_traveled, @max_distance = 0, 50
  end
  #--------------------------------------#
  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end
  #--------------------------------------#
  def move
    @x += @speed_modifier*Math.sin(Math::PI/180*@angle)
    @y += -@speed_modifier*Math.cos(Math::PI/180*@angle)
    @x %= 1000
    @y %= 700
    @distance_traveled += 1
    kill if @distance_traveled > @max_distance
  end
  #--------------------------------------#
  def kill
    @alive = false
  end
  #--------------------------------------#
end

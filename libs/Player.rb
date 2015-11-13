class Player
  attr_accessor :x, :y, :angle
  #--------------------------------------#
  def initialize
    @image = Gosu::Image.new("assets/nave1.png")
    @x = @y = @vel_x = @vel_y = @angle = 0.0
    @score = 0 #Puntaje
    @lives = 5 #Vida
  end
  #--------------------------------------#
  def warp(x, y)
    @x, @y = x, y
  end
  #--------------------------------------#
  def turn_left
    @angle -= 4.5
  end
  #--------------------------------------#
  def turn_right
    @angle += 4.5
  end
  #--------------------------------------#
  def accelerate
    @vel_x += Gosu::offset_x(@angle, 0.4)
    @vel_y += Gosu::offset_y(@angle, 0.4)
  end
  #--------------------------------------#
  def move
    @x += @vel_x
    @y += @vel_y
    @x %= 1000
    @y %= 700

    @vel_x *= 0.95
    @vel_y *= 0.95
  end
  #--------------------------------------#
  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end
  #--------------------------------------#
end

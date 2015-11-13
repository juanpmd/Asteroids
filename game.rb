require 'gosu'
require './libs/Player.rb'
require './libs/Projectile.rb'
require './libs/Asteroid.rb'

#........................................#
class GameWindow < Gosu::Window

  def initialize
    super(1000, 700, false) #Creacion Pantalla
    @game_in_progress = false
    self.caption = "Asteroids Redes" #Titulo Pantalla
    @font = Gosu::Font.new(self, "assets/victor-pixel.ttf", 34)
  end

  def setup_game
    @player = Player.new
    @player.warp(650, 350)
    @game_in_progress = true
    @projectiles = []
    @cooldown = 60 #Espacios que recorre una bala antes de podes disparar otra
    @asteroid_count = 3
    @asteroids = Asteroid.spawn(@asteroid_count)
  end

  def Start_Screen
  end
  #--------------------------------------#
  def update

    if Gosu::button_down? Gosu::KbQ #Salir con tecla Q
      close
    end
    if button_down? Gosu:: KbP
      setup_game unless @game_in_progress
    end

    if @player #si existe jugador permite moverlo
      if Gosu::button_down? Gosu::KbSpace then
        if @cooldown < 25 #es el cooldown para que se pueda disparar, solo se puede cuando @cooldown > 25
        else
          @projectiles << Projectile.new(@player)
          @cooldown = 0
        end
      end

      if Gosu::button_down? Gosu::KbLeft or Gosu::button_down? Gosu::GpLeft then
        @player.turn_left
      end
      if Gosu::button_down? Gosu::KbRight or Gosu::button_down? Gosu::GpRight then
        @player.turn_right
      end
      if Gosu::button_down? Gosu::KbUp or Gosu::button_down? Gosu::GpButton0 then
        @player.accelerate
      end
      @cooldown += 1 #Para el conteo que vuelve a permitir disparar
      @player.move
      @projectiles.each {|projectile| projectile.move}
      @projectiles.reject!{|projectile| projectile.dead?} #no elimina todos los proyectiles que dead? = false

      @asteroids.each {|asteroid| asteroid.move}

    end

  end
  #--------------------------------------#
  def draw

    unless @game_in_progress #Si el no se esta ejecutando muestra el menu
      @font.draw("ASTEROIDS", 260, 220, 50, 3, 3, Gosu::Color::rgb(255, 255, 255))
      @font.draw("Presiona 'p' Para Jugar", 300, 320, 50, 1, 1, Gosu::Color::rgb(13, 123, 255))
      @font.draw("Presiona 'q' Para Salir", 305, 345, 50, 1, 1, Gosu::Color::rgb(13, 123, 255))
    end
    if @player #Si existe jugador lo dibuja
      @player.draw
      @projectiles.each {|projectile| projectile.draw}

      @asteroids.each {|asteroid| asteroid.draw} #Dibuja todos los asteroides
    end
  end
  #--------------------------------------#
end
#........................................#
window = GameWindow.new
window.show

class MainController < ApplicationController
  def index
    gon.config = get_config
  end

  def settings
    @config = get_config
  end

  def update_settings
    config = default_config

    if params[:settings].present?
      if params[:settings][:vehicles].present?
        params[:settings][:vehicles].each do |id|
          vehicle = config['vehicles'].detect{ |vehicle| vehicle['id'].to_i == id.to_i }
          next unless vehicle.present?
          vehicle['unlocked'] = true
        end
      end

      if params[:settings][:characters].present?
        params[:settings][:characters].each do |id|
          character = config['characters'].detect{ |character| character['id'].to_i == id.to_i }
          next unless character.present?
          character['unlocked'] = true
        end
      end
    end

    set_config config
    redirect_to :root
  end

  private

  def get_config
    config = $redis.get(:config)
    config = set_config(default_config) unless config.present?
    JSON.parse config
  end

  def set_config(config)
    config = config.to_json
    $redis.set(:config, config)
    config
  end

  def default_config
    {
      'vehicles' => default_vehicles,
      'characters' => default_characters
    }
  end

  def default_vehicles
    [
      {
        'id' => 1,
        'name' => 'Kart Estándar P',
        'unlocked' => true,
        'base' => true,
        'type' => 'small'
      },
      {
        'id' => 2,
        'name' => 'Supercuna',
        'unlocked' => true,
        'base' => true,
        'type' => 'small'
      },
      {
        'id' => 3,
        'name' => 'Minibestia',
        'unlocked' => true,
        'base' => true,
        'type' => 'small'
      },
      {
        'id' => 4,
        'name' => 'Carruaje Cheep',
        'unlocked' => false,
        'base' => false,
        'type' => 'small'
      },
      {
        'id' => 5,
        'name' => 'Minitractor',
        'unlocked' => false,
        'base' => false,
        'type' => 'small'
      },
      {
        'id' => 6,
        'name' => 'Blue Falcon',
        'unlocked' => false,
        'base' => false,
        'type' => 'small'
      },
      {
        'id' => 7,
        'name' => 'Moto Estándar P',
        'unlocked' => true,
        'base' => true,
        'type' => 'small'
      },
      {
        'id' => 8,
        'name' => 'Moto Bala',
        'unlocked' => true,
        'base' => true,
        'type' => 'small'
      },
      {
        'id' => 9,
        'name' => 'Minimoto',
        'unlocked' => true,
        'base' => true,
        'type' => 'small'
      },
      {
        'id' => 10,
        'name' => 'Pato Raudo',
        'unlocked' => false,
        'base' => false,
        'type' => 'small'
      },
      {
        'id' => 11,
        'name' => 'Magiciclo',
        'unlocked' => false,
        'base' => false,
        'type' => 'small'
      },
      {
        'id' => 12,
        'name' => 'Moto Cúpula',
        'unlocked' => false,
        'base' => false,
        'type' => 'small'
      },
      {
        'id' => 13,
        'name' => 'Kart Estándar M',
        'unlocked' => true,
        'base' => true,
        'type' => 'medium'
      },
      {
        'id' => 14,
        'name' => 'Modelo Clásico',
        'unlocked' => true,
        'base' => true,
        'type' => 'medium'
      },
      {
        'id' => 15,
        'name' => 'Alerón Chiflado',
        'unlocked' => true,
        'base' => true,
        'type' => 'medium'
      },
      {
        'id' => 16,
        'name' => 'Bloopercarro',
        'unlocked' => false,
        'base' => false,
        'type' => 'medium'
      },
      {
        'id' => 17,
        'name' => 'Dominguero',
        'unlocked' => false,
        'base' => false,
        'type' => 'medium'
      },
      {
        'id' => 18,
        'name' => 'Fórmula N',
        'unlocked' => false,
        'base' => false,
        'type' => 'medium'
      },
      {
        'id' => 19,
        'name' => 'Moto Estándar M',
        'unlocked' => true,
        'base' => true,
        'type' => 'medium'
      },
      {
        'id' => 20,
        'name' => 'Moto Hipersónica',
        'unlocked' => true,
        'base' => true,
        'type' => 'medium'
      },
      {
        'id' => 21,
        'name' => 'Ciclomotor Dulzón',
        'unlocked' => true,
        'base' => true,
        'type' => 'medium'
      },
      {
        'id' => 22,
        'name' => 'Zum-Zum',
        'unlocked' => false,
        'base' => false,
        'type' => 'medium'
      },
      {
        'id' => 23,
        'name' => 'Nitrocicleta',
        'unlocked' => false,
        'base' => false,
        'type' => 'medium'
      },
      {
        'id' => 24,
        'name' => 'Velocidelfín',
        'unlocked' => false,
        'base' => false,
        'type' => 'medium'
      },
      {
        'id' => 25,
        'name' => 'Kart Estándar G',
        'unlocked' => true,
        'base' => true,
        'type' => 'large'
      },
      {
        'id' => 26,
        'name' => 'Todoterreno',
        'unlocked' => true,
        'base' => true,
        'type' => 'large'
      },
      {
        'id' => 27,
        'name' => 'Carro Fulminante',
        'unlocked' => true,
        'base' => true,
        'type' => 'large'
      },
      {
        'id' => 28,
        'name' => 'Piraña Maleante',
        'unlocked' => false,
        'base' => false,
        'type' => 'large'
      },
      {
        'id' => 29,
        'name' => 'Autodeslizador',
        'unlocked' => false,
        'base' => false,
        'type' => 'large'
      },
      {
        'id' => 30,
        'name' => 'Libertad GT',
        'unlocked' => false,
        'base' => false,
        'type' => 'large'
      },
      {
        'id' => 31,
        'name' => 'Moto Estándar G',
        'unlocked' => true,
        'base' => true,
        'type' => 'large'
      },
      {
        'id' => 32,
        'name' => 'Moto de Bowser',
        'unlocked' => true,
        'base' => true,
        'type' => 'large'
      },
      {
        'id' => 33,
        'name' => 'Moto de Wario',
        'unlocked' => true,
        'base' => true,
        'type' => 'large'
      },
      {
        'id' => 34,
        'name' => 'Estrella Fugaz',
        'unlocked' => false,
        'base' => false,
        'type' => 'large'
      },
      {
        'id' => 35,
        'name' => 'Proyectil',
        'unlocked' => false,
        'base' => false,
        'type' => 'large'
      },
      {
        'id' => 36,
        'name' => 'Fantasma',
        'unlocked' => false,
        'base' => false,
        'type' => 'large'
      }
    ]
  end

  def default_characters
    [
      {
        'id' => 1,
        'name' => 'Baby Mario',
        'image' => '/assets/character/babymario.png',
        'type' => 'small',
        'unlocked' => true,
        'base' => true
      },
      {
        'id' => 2,
        'name' => 'Baby Luigi',
        'image' => '/assets/character/babyluigi.png',
        'type' => 'small',
        'unlocked' => false,
        'base' => false
      },
      {
        'id' => 3,
        'name' => 'Baby Peach',
        'image' => '/assets/character/babypeach.png',
        'type' => 'small',
        'unlocked' => true,
        'base' => true
      },
      {
        'id' => 4,
        'name' => 'Baby Daisy',
        'image' => '/assets/character/babydaisy.png',
        'type' => 'small',
        'unlocked' => false,
        'base' => false
      },
      {
        'id' => 5,
        'name' => 'Toad',
        'image' => '/assets/character/toad.jpg',
        'type' => 'small',
        'unlocked' => true,
        'base' => true
      },
      {
        'id' => 6,
        'name' => 'Toadette',
        'image' => '/assets/character/toadette.png',
        'type' => 'small',
        'unlocked' => false,
        'base' => false
      },
      {
        'id' => 7,
        'name' => 'Koopa Troopa',
        'image' => '/assets/character/koopatroopa.png',
        'type' => 'small',
        'unlocked' => true,
        'base' => true
      },
      {
        'id' => 8,
        'name' => 'Dry Bones',
        'image' => '/assets/character/drybones.png',
        'type' => 'small',
        'unlocked' => false,
        'base' => false
      },
      {
        'id' => 9,
        'name' => 'Mario',
        'image' => '/assets/character/mario.jpg',
        'type' => 'medium',
        'unlocked' => true,
        'base' => true
      },
      {
        'id' => 10,
        'name' => 'Luigi',
        'image' => '/assets/character/luigi.jpg',
        'type' => 'medium',
        'unlocked' => true,
        'base' => true
      },
      {
        'id' => 11,
        'name' => 'Peach',
        'image' => '/assets/character/peach.png',
        'type' => 'medium',
        'unlocked' => true,
        'base' => true
      },
      {
        'id' => 12,
        'name' => 'Daisy',
        'image' => '/assets/character/daisy.png',
        'type' => 'medium',
        'unlocked' => false,
        'base' => false
      },
      {
        'id' => 13,
        'name' => 'Yoshi',
        'image' => '/assets/character/yoshi.png',
        'type' => 'medium',
        'unlocked' => true,
        'base' => true
      },
      {
        'id' => 14,
        'name' => 'Birdo',
        'image' => '/assets/character/birdo.png',
        'type' => 'medium',
        'unlocked' => false,
        'base' => false
      },
      {
        'id' => 15,
        'name' => 'Diddy Kong',
        'image' => '/assets/character/diddykong.png',
        'type' => 'medium',
        'unlocked' => false,
        'base' => false
      },
      {
        'id' => 16,
        'name' => 'Bowser Jr.',
        'image' => '/assets/character/bowserjr.png',
        'type' => 'medium',
        'unlocked' => false,
        'base' => false
      },
      {
        'id' => 17,
        'name' => 'Wario',
        'image' => '/assets/character/wario.png',
        'type' => 'large',
        'unlocked' => true,
        'base' => true
      },
      {
        'id' => 18,
        'name' => 'Waluigi',
        'image' => '/assets/character/waluigi.png',
        'type' => 'large',
        'unlocked' => true,
        'base' => true
      },
      {
        'id' => 19,
        'name' => 'Donkey Kong',
        'image' => '/assets/character/donkeykong.png',
        'type' => 'large',
        'unlocked' => true,
        'base' => true
      },
      {
        'id' => 20,
        'name' => 'Bowser',
        'image' => '/assets/character/bowser.jpg',
        'type' => 'large',
        'unlocked' => true,
        'base' => true
      },
      {
        'id' => 21,
        'name' => 'King Boo',
        'image' => '/assets/character/kingboo.png',
        'type' => 'large',
        'unlocked' => false,
        'base' => false
      },
      {
        'id' => 22,
        'name' => 'Rosalina',
        'image' => '/assets/character/rosalina.png',
        'type' => 'large',
        'unlocked' => false,
        'base' => false
      },
      {
        'id' => 23,
        'name' => 'Funky Kong',
        'image' => '/assets/character/funkykong.png',
        'type' => 'large',
        'unlocked' => false,
        'base' => false
      },
      {
        'id' => 24,
        'name' => 'Dry Bowser',
        'image' => '/assets/character/drybowser.png',
        'type' => 'large',
        'unlocked' => false,
        'base' => false
      }
    ]
  end
end

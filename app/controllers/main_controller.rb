class MainController < ApplicationController
  def index
    gon.config = get_config
  end

  def update
    set_config params[:config]
    render nothing: true
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
      vehicles: default_vehicles,
      characters: default_characters
    }
  end

  def default_vehicles
    {
      small: [
        {
          name: 'Kart Estándar',
          unlocked: true
        },
        {
          name: 'Supercuna',
          unlocked: true
        },
        {
          name: 'Minibestia',
          unlocked: true
        },
        {
          name: 'Carruaje Cheep',
          unlocked: false
        },
        {
          name: 'Minitractor',
          unlocked: false
        },
        {
          name: 'Blue Falcon',
          unlocked: false
        },
        {
          name: 'Moto Estándar',
          unlocked: true
        },
        {
          name: 'Moto Bala',
          unlocked: true
        },
        {
          name: 'Minimoto',
          unlocked: true
        },
        {
          name: 'Pato Raudo',
          unlocked: false
        },
        {
          name: 'Magiciclo',
          unlocked: false
        },
        {
          name: 'Moto Cúpula',
          unlocked: false
        }
      ],

      medium: [
        {
          name: 'Kart Estándar',
          unlocked: true
        },
        {
          name: 'Modelo Clásico',
          unlocked: true
        },
        {
          name: 'Alerón Chiflado',
          unlocked: true
        },
        {
          name: 'Bloopercarro',
          unlocked: false
        },
        {
          name: 'Dominguero',
          unlocked: false
        },
        {
          name: 'Súper Rayo GTI',
          unlocked: false
        },
        {
          name: 'Moto Estándar',
          unlocked: true
        },
        {
          name: 'Moto Hipersónica',
          unlocked: true
        },
        {
          name: 'Ciclomotor Dulzón',
          unlocked: true
        },
        {
          name: 'Zum-Zum',
          unlocked: false
        },
        {
          name: 'Nitrocicleta',
          unlocked: false
        },
        {
          name: 'Velocidelfín',
          unlocked: false
        }
      ],

      large: [
        {
          name: 'Kart Estándar',
          unlocked: true
        },
        {
          name: 'Todoterreno',
          unlocked: true
        },
        {
          name: 'Carro Fulminante',
          unlocked: true
        },
        {
          name: 'Piraña Maleante',
          unlocked: false
        },
        {
          name: 'Autodeslizador',
          unlocked: false
        },
        {
          name: 'Libertad GT',
          unlocked: false
        },
        {
          name: 'Moto Estándar',
          unlocked: true
        },
        {
          name: 'Moto de Bowser',
          unlocked: true
        },
        {
          name: 'Moto de Wario',
          unlocked: true
        },
        {
          name: 'Estrella Fugaz',
          unlocked: false
        },
        {
          name: 'Torpedo proyectil',
          unlocked: false
        },
        {
          name: 'Fantasma',
          unlocked: false
        }
      ]
    }
  end

  def default_characters
    [
      {
        name: 'Baby Mario',
        image: '/assets/character/babymario.png',
        type: 'small',
        unlocked: true
      },
      {
        name: 'Baby Luigi',
        image: '/assets/character/babyluigi.png',
        type: 'small',
        unlocked: false
      },
      {
        name: 'Baby Peach',
        image: '/assets/character/babypeach.png',
        type: 'small',
        unlocked: true
      },
      {
        name: 'Baby Daisy',
        image: '/assets/character/babydaisy.png',
        type: 'small',
        unlocked: false
      },
      {
        name: 'Toad',
        image: '/assets/character/toad.jpg',
        type: 'small',
        unlocked: true
      },
      {
        name: 'Toadette',
        image: '/assets/character/toadette.png',
        type: 'small',
        unlocked: false
      },
      {
        name: 'Koopa Troopa',
        image: '/assets/character/koopatroopa.png',
        type: 'small',
        unlocked: true
      },
      {
        name: 'Dry Bones',
        image: '/assets/character/drybones.png',
        type: 'small',
        unlocked: false
      },
      {
        name: 'Mario',
        image: '/assets/character/mario.jpg',
        type: 'medium',
        unlocked: true
      },
      {
        name: 'Luigi',
        image: '/assets/character/luigi.jpg',
        type: 'medium',
        unlocked: true
      },
      {
        name: 'Peach',
        image: '/assets/character/peach.png',
        type: 'medium',
        unlocked: true
      },
      {
        name: 'Daisy',
        image: '/assets/character/daisy.png',
        type: 'medium',
        unlocked: false
      },
      {
        name: 'Yoshi',
        image: '/assets/character/yoshi.png',
        type: 'medium',
        unlocked: true
      },
      {
        name: 'Birdo',
        image: '/assets/character/birdo.png',
        type: 'medium',
        unlocked: false
      },
      {
        name: 'Diddy Kong',
        image: '/assets/character/diddykong.png',
        type: 'medium',
        unlocked: false
      },
      {
        name: 'Bowser Jr.',
        image: '/assets/character/bowserjr.png',
        type: 'medium',
        unlocked: false
      },
      {
        name: 'Wario',
        image: '/assets/character/wario.png',
        type: 'large',
        unlocked: true
      },
      {
        name: 'Waluigi',
        image: '/assets/character/waluigi.png',
        type: 'large',
        unlocked: true
      },
      {
        name: 'Donkey Kong',
        image: '/assets/character/donkeykong.png',
        type: 'large',
        unlocked: true
      },
      {
        name: 'Bowser',
        image: '/assets/character/bowser.jpg',
        type: 'large',
        unlocked: true
      },
      {
        name: 'King Boo',
        image: '/assets/character/kingboo.png',
        type: 'large',
        unlocked: false
      },
      {
        name: 'Rosalina',
        image: '/assets/character/rosalina.png',
        type: 'large',
        unlocked: false
      },
      {
        name: 'Funky Kong',
        image: '/assets/character/funkykong.png',
        type: 'large',
        unlocked: false
      },
      {
        name: 'Dry Bowser',
        image: '/assets/character/drybowser.png',
        type: 'large',
        unlocked: false
      }
    ]
  end
end

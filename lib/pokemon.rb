class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id: id, name: name, type: type, db: db)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = nil
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (id, name, type) VALUES ( ?, ?, ? )", [@id, name, type])
  end

  def self.find(id, db)
    data = db.execute("SELECT pokemon.id, pokemon.name, pokemon.type FROM pokemon WHERE pokemon.id = ( #{id} )")[0]
    # print data. This is an array [1, "Pikachu", "electric"]
    new_pokemon = Pokemon.new(id: id, name: data[1], type: data[2], db: db)
    new_pokemon.hp = 60
    new_pokemon
  end

  def alter_hp
    if self.name == "Pikachu"
      self.hp - 1
    else
      self.hp = 0
    end
  end

end

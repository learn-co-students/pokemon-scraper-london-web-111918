class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize (pokemon)
    @id = pokemon[:id]
    @name = pokemon[:name]
    @type = pokemon[:type]
    @db = pokemon[:db]
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id)[0]
    Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db)
  end
end

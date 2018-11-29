class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    self.id = id
    self.name = name
    self.type = type
    self.db = db
  end

  def self.save(name, type, database)
    database.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
  end

  def self.find(id, database)
    found = database.execute("SELECT * FROM pokemon WHERE id = ?;", id)[0]
    pokemon = {id: found[0], name: found[1], type: found[2], db: database}
    Pokemon.new(pokemon)
  end

end

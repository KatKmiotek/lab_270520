require_relative('../db/sql_runner')
require_relative('./student')

class House

attr_accessor :id, :name, :logo

def initialize(options)
  @id = options['id'].to_i if options['id']
  @name = options['name']
  @logo = options['logo']
end

def save()
  sql = "INSERT INTO houses (name, logo) VALUES ($1, $2)
  RETURNING id"
  values = [@name, @logo]
  result = SqlRunner.run(sql, values)
  @id = result[0]['id'].to_i
end

def self.find_all()
  sql = " SELECT * FROM houses"
  result = SqlRunner.run(sql)
  houses = result.map { |house| House.new(house) }
  return houses
end

def self.find_by_id(id)
  sql = "SELECT * FROM houses WHERE id = $1"
  values = [id]
  result = SqlRunner.run(sql, values)
  house = House.new(result.first)
  return house
end


def self.delete_all()
  sql= "DELETE FROM houses"
  SqlRunner.run(sql)
end

end

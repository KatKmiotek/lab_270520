require_relative('../db/sql_runner')
require_relative('./house')

class Student

attr_accessor :id, :first_name, :last_name, :age, :house_id

def initialize(options)
  @id = options['id'].to_i if options['id']
  @first_name = options['first_name']
  @last_name = options['last_name']
  @house_id = options['house_id'].to_i
  @age = options['age'].to_i
end

def save()
  sql = "INSERT INTO students (first_name, last_name, house_id, age) VALUES ($1, $2, $3, $4)
  RETURNING id"
  values = [@first_name, @last_name, @house_id, @age]
  result = SqlRunner.run(sql, values)
  @id = result[0]['id'].to_i
end

def delete()
  sql = " DELETE FROM students WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end

def find_house()
  sql = "SELECT * FROM houses INNER JOIN students ON houses.id = students.house_id WHERE students.id = $1"
  values = [@id]
  result = SqlRunner.run(sql, values)
  return result.map { |house| House.new(house) }
end

def self.find_all()
  sql = " SELECT * FROM students"
  result = SqlRunner.run(sql)
  students = result.map { |student| Student.new(student) }
  return students
end

def self.find_by_id(id)
  sql = "SELECT * FROM students WHERE id = $1"
  values = [id]
  result = SqlRunner.run(sql, values)
  student = Student.new(result.first)
  return student
end

def self.delete_all()
  sql= "DELETE FROM students"
  SqlRunner.run(sql)
end




end

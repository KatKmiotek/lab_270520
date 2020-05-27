require('pry')
require_relative('../models/student')
require_relative('../models/house')

Student.delete_all()
House.delete_all()

house1 = House.new({
  'name' => 'Gryffindor',
  'logo' => '../public/logo1'
  })
house2 = House.new({
  'name' => 'Slytherin',
  'logo' => '../public/logo2'
  })
house3 = House.new({
  'name' => 'Ravenclaw',
  'logo' => '../public/logo3'
  })
house4 = House.new({
  'name' => 'Hufflepuff',
  'logo' => '../public/logo4'
  })

house1.save()
house2.save()
house3.save()
house4.save()


student1 = Student.new({
  'first_name'=> 'Harry',
  'last_name' => 'Potter',
  'house_id' => house1.id,
  'age' => 12
  })
student2 = Student.new({
  'first_name'=> 'Ron',
  'last_name' => 'Weasley',
  'house_id' => house2.id,
  'age' => 12
  })
student3 = Student.new({
  'first_name'=> 'Hermione',
  'last_name' => 'Granger',
  'house_id' => house3.id,
  'age' => 12
  })

student1.save()
student2.save()
student3.save()




binding.pry
nil

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << admin.email << ' PASSWORD : ' << admin.password
user = CreateUserService.new.call("user@example.com")
puts 'CREATED TEST USER: ' << user.email << ' PASSWORD : ' << user.password
user = CreateUserService.new.call("user1@example.com")
puts 'CREATED TEST USER: ' << user.email << ' PASSWORD : ' << user.password
user = CreateUserService.new.call("user2@example.com")
puts 'CREATED TEST USER: ' << user.email << ' PASSWORD : ' << user.password
user = CreateUserService.new.call("user3@example.com")
puts 'CREATED TEST USER: ' << user.email << ' PASSWORD : ' << user.password
user = CreateUserService.new.call("user4@example.com")
puts 'CREATED TEST USER: ' << user.email << ' PASSWORD : ' << user.password
user = CreateUserService.new.call("user5@example.com")
puts 'CREATED TEST USER: ' << user.email << ' PASSWORD : ' << user.password
user = CreateUserService.new.call("user6@example.com")
puts 'CREATED TEST USER: ' << user.email << ' PASSWORD : ' << user.password
user = CreateUserService.new.call("user7@example.com")
puts 'CREATED TEST USER: ' << user.email << ' PASSWORD : ' << user.password
user = CreateUserService.new.call("user8@example.com")
puts 'CREATED TEST USER: ' << user.email << ' PASSWORD : ' << user.password
user = CreateUserService.new.call("user9@example.com")
puts 'CREATED TEST USER: ' << user.email << ' PASSWORD : ' << user.password
user = CreateUserService.new.call("user10@example.com")
puts 'CREATED TEST USER: ' << user.email << ' PASSWORD : ' << user.password

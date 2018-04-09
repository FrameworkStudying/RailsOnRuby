require 'faker'

# using FactoryBot, you could stub in some data
FactoryBot.define do
	factory :contact do
		# using Faker, you could generate the member variable randomly
		firstname { Faker::Name.first_name }
		lastname { Faker::Name.last_name }
	end
end

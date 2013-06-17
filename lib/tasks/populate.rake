namespace :db do
	desc "Fill database with fake designs"
	task populate: :environment do
		make_designs
	end
end

def make_designs
	5.times do |n|
		title = "design #{n+1}"	
		description = Faker::Lorem.sentence(5)
		date = '2013-06-13'
		size = "#{n}x#{n}"
		price = 100*n
		thumbnail = "junk"
		Design.create(title:title,
					  description:description,
					  date:date,
					  price:price,
					  size:size,
					  thumbnail:thumbnail,
					  user_id:1)
	end					  	
end

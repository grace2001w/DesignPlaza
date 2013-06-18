namespace :db do
	desc "Fill database with fake designs"
	task populate: :environment do
		make_designs
	end
end

def make_designs
	9.times do |n|
		n = n+1
		title = "design #{n}"	
		description = Faker::Lorem.sentence(5)
		date = '2013-06-17'
		size = "#{n}x#{n}"
		price = 100*n
		puts Rails.root
		image = open(File.join(Rails.root, "app/assets/images/seeds/image#{n}.jpg"))
		Design.create!(title:title,
					  description:description,
					  date:date,
					  price:price,
					  size:size,
					  image:image,
					  user_id:1)

	end					  	
end

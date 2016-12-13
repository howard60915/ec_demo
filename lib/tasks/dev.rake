namespace :dev do
  desc "Generating some fake data"
    task :rebuild => ["db:reset" , :fake]
      task :fake => :environment do
          # Users data
          @user = User.create(:email => "howard@gmail.com", :password => "12345678", :admin => true)
          User.create(:email => "test@gmail.com", :password => "12345678")
          User.create(:email => "xxx@gmail.com", :password => "12345678")

          # Category data
          Category.create(:name => "watch", :description => Faker::Lorem.sentence(3, true))
          Category.create(:name => "coat", :description => Faker::Lorem.sentence(3, true))
          Category.create(:name => "phone shell", :description => Faker::Lorem.sentence(3, true))

          #Firm data
          3.times do
            Firm.create(
              :name => Faker::Company.name, 
              :industry => Faker::Company.profession, 
              :tel => Faker::PhoneNumber.cell_phone,
              :address => Faker::Address.street_address
              )
          end

          #Products Data
          Category.all.each do |category|
            5.times do 
              category.products.create(
                :name => Faker::Commerce.product_name, 
                :content => Faker::Lorem.sentence(3, true), 
                :price => Faker::Commerce.price, 
                :firm_id => category.id
                )
            end  
          end  
      end
end

require 'csv'

namespace :one_time_tasks do
  desc 'Seed insurance carriers'
  task seed_carriers: :environment do
    carriers = ['Delta Dental', 'Guardian', 'Humana', 'Aetna', 'Cigna', 'UnitedHealthcare',
      'Physicians Mutual', 'AARP', 'Ameritas', 'Spirit Dental & Vision']
    carriers.each{|c| InsuranceCarrier.create(name: c) }
  end

  desc 'Seed dentists'
  task seed_dentists: :environment do
  	num = 0
  	file = File.read(File.join(Rails.root, 'lib','assets','delta100.csv'))
  	rows = CSV.parse(file, headers: true)
  	rows.each do |row|
  		num +=1 

  		puts '*'*50
  		puts row.inspect

  		first_name = row['Dentist'].split(' ').first.capitalize
  		last_name = row['Dentist'].split(' ')[1..-1].each(&:capitalize!).join(' ')
  		doctor = Doctor.new(
  			first_name: first_name, 
  			last_name: last_name, 
  			awards_description: row['Education'].strip,
  			email: "seeded#{num}@example.com",
  			title: row['Title'].strip,
  			gender: row['Gender'].strip,
  			seeded: true
  		)
  		doctor.skip_confirmation!
  		doctor.skip_confirmation_notification!
  		doctor.save!

  		if doctor.errors.any?
  			puts doctor.errors.inspect
  		end

  		languages = (1..7).map{|num| row["Lang#{num}"] }.join(" ")
  		
      if Office.where(name: row['Office']).any?
        office = Office.where(name: row['Office']).first
        # office.update_attributes(
        #   languages: languages,
        #   public_transit: row['Public Transit'].strip,
        #   wheelchair_accessible: row['Wheelchair'].strip,
        #   phone: row['Phone'].try(:strip),
        #   email: row['Email'].try(:strip)
        # )
      else
        office = Office.new(
    			name: row['Office'].strip,
    			languages: languages,
    			public_transit: row['Public Transit'].strip,
    			wheelchair_accessible: row['Wheelchair'].strip,
    			phone: row['Phone'].try(:strip),
    			email: row['Email'].try(:strip)
    		)
        office.yelp_url = row['Yelp'] if row['Yelp'].present?
      end
      office.save!


  		if office.errors.any?
  			puts office.errors.inspect
  		end

  		address = Address.new(  			
				  				street1: row['Street1'].try(:strip),
				  				street2: row['Street2'].try(:strip),
				  				city: row['City'].try(:strip),
				  				state: row['State'].try(:strip),
				  				zip_code: row['Zip'].try(:strip),
				  				office_id: office.id
				  			)
  		address.save!
  		
  		if address.errors.any?
  			puts address.errors.inspect
  		end
  		## Add employee
  		office.employees.create(user_id: doctor.id)

  		(1..3).each do |num|
  			next if row["Plan#{num}"].blank?
  			puts row["Plan#{num}"].inspect
				plan = InsurancePlan.where(name: row["Plan#{num}"].strip).first
        next unless plan
  			office.accepted_plans.create(insurance_plan_id: plan.id)
  		end

  		sleep 10
  	end
  end
end

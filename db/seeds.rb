puts "🌱 Seeding spices..."

# Seed your database here
20.times do 
    seeded_client = Client.create(
        name: Faker::Name.name,
        location: Faker::Address.street_address,
        email: Faker::Internet.email
    )
end

6.times do
    seeded_constructions = Construction.create(
        description: ["Top", "Average", "Lower"].sample,
        client_id: rand(1..6),
        project_manager_id: rand(1..8)
    )
end

15.times do 
    seeded_project_managers = Project_manager.create(
        name: Faker::Name.name,
        age: rand(30..50),
        experience: rand(1..5)
    )
end

puts "✅ Done seeding!"

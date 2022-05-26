9.times do
    Category.create! name: Faker::Hacker.ingverb.capitalize
end

category_ids = Category.pluck(:id)

print "Product"
200.times do
    product = Product.create!(name: "#{Faker::Hacker.noun}".capitalize,
        description: Faker::Hacker.say_something_smart,
        long_description: Faker::Lorem.paragraphs(3).join("\n\n"),
        category_id: category_ids.sample,
        price: Faker::Number.decimal(3, 2))

    product.save
    print "."
end

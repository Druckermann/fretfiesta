require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning database"
Listing.destroy_all
User.destroy_all

puts "Creating database..."

# Note: we would need to adjust model for inclusion of rating.
# Note: we need a "$" and a "per day" for each price in the view

User.create(id: 1, first_name: "John", last_name: "Doe", password: "123456", password_confirmation: "123456", email: "johndoe@example.com", location: "4053")

User.create(id: 2, first_name: "Emily", last_name: "Chen", password: "123456", password_confirmation: "123456",  email: "emilychen@example.com", location: "4000")

User.create(id: 3, first_name: "David", last_name: "Nguyen", password: "123456", password_confirmation: "123456",  email: "davidnguyen@example.com", location: "4034")

User.create(id: 4, first_name: "Sophia", last_name: "Kim", password: "123456", password_confirmation: "123456",  email: "sophiakim@example.com", location: "4051")

User.create(id: 5, first_name: "Sarah", last_name: "Johnson", password: "123456", password_confirmation: "123456",  email: "sarahjohnson@example.com", location: "4055")

User.create(id: 6, first_name: "Daniel", last_name: "Lee", password: "123456", password_confirmation: "123456",  email: "daniellee@example.com", location: "4060")

User.create(id: 7, first_name: "Michael", last_name: "Brown", password: "123456", password_confirmation: "123456",  email: "michaelbrown@example.com", location: "4171")

# file = "image.jpg"
# article = Article.new(title: "NES", body: "A great console")
# article.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# article.save

listing_1 = Listing.create(user_id: 1, category: "Electric 6-string guitar", name: "Fender Strat", price: "100", description: "My cherished 1992 Fender Stratocaster is a work of art. The alder body's glossy polyurethane finish showcases its sleek curves, while the maple neck with a rosewood fingerboard feels like pure silk under my fingers. The custom-wound pickups deliver a wide range of tones, from bright and jangly to smooth and soulful. The synchronized tremolo bridge and precise tuning machines make it a joy to play, while the classic design and legendary tone make it a true masterpiece. It's my trusted companion on stage and in the studio, a guitar that inspires me to create music and brings endless joy to my playing.", location: "4053", rating: "8")
# listing_1.photo.attach(io: File.open(Rails.root.join("app/assets/images/Fender_strat.jpg")), filename: "Fender_strat.jpg")
file = URI.open('https://res.cloudinary.com/dfjxi1sna/image/upload/v1681810449/Fender_strat_lsmpej.jpg')
listing_1.photo.attach(io: file, filename: "Fender_strat.jpg")
listing_1.save

listing_2 = Listing.create(user_id: 2, category: "Electric 6-string guitar", name: "Gibson Les Paul", price: "200", description: "My Gibson Les Paul Standard 1959 Reissue from 2003 is a true masterpiece. Its flame maple top, finished in a luscious Heritage Cherry Sunburst, is breathtaking. The solid mahogany body and neck provide rich sustain and resonance. The Burstbucker pickups deliver unparalleled tone, from warm and bluesy to biting and aggressive. The attention to detail, including the historically accurate neck profile and vintage hardware, is remarkable. It's a guitar that exudes timeless elegance and has a legendary status in the world of electric guitars.", location: "4000", rating: "9")
# listing_2.photo.attach(io: File.open(Rails.root.join("app/assets/images/Gibson.jpg")), filename: "Gibson.jpg")
file = URI.open('https://res.cloudinary.com/dfjxi1sna/image/upload/v1681810445/Gibson_da8nko.jpg')
listing_2.photo.attach(io: file, filename: "Gibson.jpg")
listing_2.save

listing_3 = Listing.create(user_id: 3, category: "Electric 5-string bass", name: "Music Man", price: "110", description: "My Music Man StingRay 5, a 5-string bass guitar from 2005, is a workhorse.  The maple neck with a rosewood fretboard offers smooth playability. The humbucking pickup delivers a thunderous, punchy tone with unrivaled clarity. The active 3-band EQ allows for versatile tone shaping. The solid hardware and rock-solid construction ensure reliability on stage and in the studio. It's a bass that provides me with the low-end foundation and versatility to hold down any groove with authority.", location: "4034", rating: "7")
# listing_3.photo.attach(io: File.open(Rails.root.join("app/assets/images/Music_man.jpg")), filename: "Music_man.jpg")
file = URI.open('https://res.cloudinary.com/dfjxi1sna/image/upload/v1681810445/Music_man_ms5wxv.jpg')
listing_3.photo.attach(io: file, filename: "Music_man.jpg")
listing_3.save

listing_4 = Listing.create(user_id: 4, category: "Electric 6-string guitar", name: "Harmony Silhouette", price: "20", description: "My Harmony H-802 Silhouette from the 1970s may not be top-tier, but it gets the job done. The plywood body lacks the finesse of high-end guitars, but the sunburst finish has a rustic charm. The single-coil pickups offer a decent range of tones, albeit with some hum. The bolt-on neck with a rosewood fingerboard is playable, though not as smooth as more expensive guitars. It's a budget-friendly option that still lets me rock out and express my musical creativity.", location: "4051", rating: "8")
# listing_4.photo.attach(io: File.open(Rails.root.join("app/assets/images/Harmony.jpg")), filename: "Harmony.jpg")
file = URI.open('https://res.cloudinary.com/dfjxi1sna/image/upload/v1681810445/Harmony_bumclb.jpg')
listing_4.photo.attach(io: file, filename: "Harmony.jpg")
listing_4.save

listing_5 = Listing.create(user_id: 5, category: "Classical 6-string guitar", name: "Ramirez 1A", price: "170", description: "My Ramirez 1A classical guitar from 2010 is a masterpiece of Spanish craftsmanship. The solid cedar top and Indian rosewood back and sides produce a rich, warm tone with remarkable clarity and projection. The ebony fingerboard and traditional Spanish fan bracing enhance its playability and tone. The exquisite detailing, including the elegant rosette and premium tuners, are a testament to its quality. It's a guitar that allows me to achieve the true essence of classical music, with its exceptional tone and playability.", location: "4055", rating: "6")
# listing_5.photo.attach(io: File.open(Rails.root.join("app/assets/images/Ramirez.jpg")), filename: "Ramirez.jpg")
file = URI.open('https://res.cloudinary.com/dfjxi1sna/image/upload/v1681810447/Ramirez_jqbxek.jpg')
listing_5.photo.attach(io: file, filename: "Ramirez.jpg")
listing_5.save

listing_6 = Listing.create(user_id: 6, category: "Electric 4-string bass", name: "Fender Precision Bass", price: "90", description: "My 1960 Fender Precision Bass is a true legend in the world of bass guitars. Its iconic design, with a sleek alder body and a smooth maple neck, is a timeless classic. The split-coil pickup delivers a punchy, defined tone that has defined the sound of modern music. The precision craftsmanship, including the meticulous fretwork and premium hardware, is top-notch. It's a bass guitar that has been the backbone of countless grooves, and its legendary status as the original electric bass guitar cannot be overstated.", location: "4060", rating: "8")
# listing_6.photo.attach(io: File.open(Rails.root.join("app/assets/images/Fender_p.JPG")), filename: "Fender_p.JPG")
file = URI.open('https://res.cloudinary.com/dfjxi1sna/image/upload/v1681810446/Fender_p_iaa398.jpg')
listing_6.photo.attach(io: file, filename: "Fender_p.jpg")
listing_6.save

listing_7 = Listing.create(user_id: 6, category: "Electric 7-string guitar", name: "Ibanez Axe", price: "55", description: "My Ibanez RG752AHM FX, a 7-string electric guitar from 2018, is a beast of a guitar. The ash body's striking Open Pore Surreal Blue Burst finish reveals its raw beauty. The Wizard-7 neck with offers lightning-fast playability. The DiMarzio pickups deliver a massive range of tones, from tight and articulate to heavy and crushing. The Gibraltar Standard II-7 bridge ensures rock-solid tuning stability, perfect for low-tuned riffing. It's a guitar that empowers me to explore new sonic territories and create crushing, modern metal tones.", location: "4060", rating: "9")
# listing_7.photo.attach(io: File.open(Rails.root.join("app/assets/images/Ibanez.jpg")), filename: "Ibanez.jpg")
file = URI.open('https://res.cloudinary.com/dfjxi1sna/image/upload/v1681810447/Ibanez_lqgung.jpg')
listing_7.photo.attach(io: file, filename: "Ibanez.jpg")
listing_7.save
puts "Finished!"

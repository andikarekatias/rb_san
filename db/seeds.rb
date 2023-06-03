# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(email: "mail@andikarekatias.com", 
            password: "password",
            password_confirmation: "password",
            name: "Dika",
            role: User.roles[:admin])
User.create(email: "andika.rekatias@yahoo.com", 
            password: "password",
            password_confirmation: "password",
            name: "Andi",
            role: User.roles[:moderator])            
User.create(email: "andika.rekatias@gmail.com", 
            password: "password",
            password_confirmation: "password",
            name: "Reka")

10.times do |x|
    notice = Notice.create(title: "Pengumuman #{x}",
                            body: "Pengumuman #{x} lorem ipsum dolor si amet",
                            user_id: User.second.id)
    5.times do |y|
        Comment.create(body: "Comment #{y}",
                        user_id: User.third.id,
                        notice_id: notice.id)
    end
end
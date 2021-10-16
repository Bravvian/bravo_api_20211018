# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#
Video.delete_all
Category.delete_all

%w[Exercise Education Recipe].each do |category_name|
  Category.create(name: category_name)
end

video = Video.create(title: 'Small Title', synopsis: 'A brief summary or general survey of the movie.', category: Category.first)
video.file.attach(io: File.open('app/views/videos/video_1.mp4'), filename: 'video1')

video = Video.create(title: 'Title', synopsis: 'A brief summary or general survey of the movie.', category: Category.first)
video.file.attach(io: File.open('app/views/videos/video_1.mp4'), filename: 'video1')

video = Video.create(title: 'Title 3', synopsis: 'A brief summary or general survey of the movie.', category: Category.second)
video.file.attach(io: File.open('app/views/videos/video_1.mp4'), filename: 'video1')

video = Video.create(title: 'Really big title - That will change the card size', synopsis: 'A brief summary or general survey of the movie.', category: Category.second)
video.file.attach(io: File.open('app/views/videos/video_1.mp4'), filename: 'video1')

video = Video.create(title: 'Small Title - Change Size', synopsis: 'A brief summary or general survey of the movie.', category: Category.third)
video.file.attach(io: File.open('app/views/videos/video_1.mp4'), filename: 'video1')


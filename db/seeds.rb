# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

# Clear existing records to avoid duplication
puts "Clearing existing data..."
Progress.destroy_all
Lesson.destroy_all
Course.destroy_all
User.destroy_all

# Create admin and learners
puts "Creating users..."
admin = User.create!(
  name: "Admin User",
  email: "admin@example.com",
  password: "password123",
  role: "admin"
)

learner1 = User.create!(
  name: "John Doe",
  email: "johndoe@example.com",
  password: "password123",
  role: "apprenant"
)

learner2 = User.create!(
  name: "Jane Smith",
  email: "janesmith@example.com",
  password: "password123",
  role: "apprenant"
)

# Create courses
puts "Creating courses..."
course1 = Course.create!(
  title: "Introduction to Ruby",
  description: "Learn the basics of the Ruby programming language.",
  difficulty_level: "beginner",
  created_by_id: admin.id
)

course2 = Course.create!(
  title: "Intermediate Ruby Concepts",
  description: "Dive deeper into Ruby with intermediate concepts.",
  difficulty_level: "intermediate",
  created_by_id: admin.id
)

# Create lessons for each course
puts "Creating lessons..."
lesson1 = Lesson.create!(
  course: course1,
  title: "What is Ruby?",
  content: "Ruby is a dynamic, open-source programming language...",
  video_url: "https://example.com/intro-to-ruby"
)

lesson2 = Lesson.create!(
  course: course1,
  title: "Setting up Ruby Environment",
  content: "Learn how to set up your Ruby environment on your computer...",
  video_url: "https://example.com/setup-ruby"
)

lesson3 = Lesson.create!(
  course: course2,
  title: "Understanding Ruby Blocks",
  content: "Explore Ruby blocks and how to use them in your code...",
  video_url: "https://example.com/ruby-blocks"
)

lesson4 = Lesson.create!(
  course: course2,
  title: "Working with Gems",
  content: "Learn about Ruby Gems and how to use them in your projects...",
  video_url: "https://example.com/ruby-gems"
)

# Track user progress
puts "Creating progress records..."
Progress.create!(
  user: learner1,
  lesson: lesson1,
  completed: true
)

Progress.create!(
  user: learner1,
  lesson: lesson2,
  completed: false
)

Progress.create!(
  user: learner2,
  lesson: lesson3,
  completed: true
)

Progress.create!(
  user: learner2,
  lesson: lesson4,
  completed: false
)

puts "Seeding complete!"

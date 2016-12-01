# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.create!(user_name: "Bob")
u2 = User.create!(user_name: "Mark")

p1 = Poll.create!(title: "Poll1", author_id: User.all.first.id)
p2 = Poll.create!(title: "Poll2", author_id: User.all.first.id)
p3 = Poll.create!(title: "Poll3", author_id: User.all.last.id)

q1 = Question.create!(question: "Hello1?", poll_id: p1.id)
q2 = Question.create!(question: "Hello2?", poll_id: p1.id)
q3 = Question.create!(question: "Hello3?", poll_id: p1.id)
q4 = Question.create!(question: "Hello4?", poll_id: p2.id)
q5 = Question.create!(question: "Hello5?", poll_id: p2.id)
q6 = Question.create!(question: "Hello6?", poll_id: p3.id)

a1 = AnswerChoice.create!(answer: "Answer1", question_id: q1.id)
a2 = AnswerChoice.create!(answer: "Answer2", question_id: q3.id)
a3 = AnswerChoice.create!(answer: "Answer3", question_id: q5.id)
a4 = AnswerChoice.create!(answer: "Answer4", question_id: q2.id)

r1 = Response.create!(response: "Yes1", user_id: u1.id, answer_choice_id: a1.id)
r2 = Response.create!(response: "Yes1", user_id: u2.id, answer_choice_id: a2.id)
r3 = Response.create!(response: "Yes1", user_id: u1.id, answer_choice_id: a4.id)

require 'open-uri'
require 'json'

class QuestionsController < ApplicationController

  def get_trivia
    amount = 50
    category = 22
    difficulty = 'medium'
    type = 'multiple'
    req = open("https://opentdb.com/api.php?amount=#{amount}&category=#{category}&difficulty=#{difficulty}&type=#{type}")
    body = req.read
    json = JSON.parse(body)

    format_choices(json)
    byebug

    render json: json
  end

  def format_choices(json)
    json['results'].each do |i|
      all_answers = i['incorrect_answers'] << i['correct_answer']
      shuffled_answers = all_answers.shuffle
      i['shuffled_answers'] = shuffled_answers
    end
  end

end

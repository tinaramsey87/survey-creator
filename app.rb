require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get('/') do
  erb(:index)
end


get('/designer/survey') do
  @surveys = Survey.all
  erb(:designer_survey)
end

post('/designer/survey') do
  survey_title = params['survey_title']
  @survey = Survey.create({ :name => survey_title })
  redirect('/designer/survey')
end

get('/taker/survey') do
  erb(:taker_survey)
end

get('/designer/survey/:id/edit') do
  @survey = Survey.find(params["id"].to_i())
  @questions = Question.all
  erb(:survey_edit)
end

patch('/designer/survey/:id') do
  survey = Survey.find(params.fetch("id").to_i())
  new_title = params.fetch('new_title')
  survey.update({ :name => new_title })
  redirect('/designer/survey')
end

delete('/designer/survey/:id') do
  survey = Survey.find(params.fetch("id").to_i())
  survey.destroy
  redirect("/designer/survey")
end

post('/designer/survey/:id') do
  @survey = Survey.find(params.fetch("id").to_i())
  @questions = Question.all
  question = params['question']
  choices = params['choices_number'].to_s
  @question = Question.create( {:description => question, :type => choices })
  erb(:survey_edit)
end

get("/question/:id/edit") do
  @questions = Question.find(params.fetch("id").to_i())
  erb(:question_edit)
end
#
# get("/designer/question/:id")do
#   question = Question.find(params.fetch("id").to_i())
#   redirect("/designer/survey/:id/edit")
# end

delete("/designer/question/:id") do
  @survey = Survey.find(params.fetch("id").to_i())
  question = Question.find(params.fetch("id").to_i())
  question.destroy
  redirect back
end

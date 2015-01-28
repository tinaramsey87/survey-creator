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
  @survey = Survey.find(params["id"].to_i)
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
  redirect("designer/survey")
end

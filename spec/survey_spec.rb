require('spec_helper')

describe(Survey) do
  it { should have_many(:questions) }

  it("should captolize each word of the title") do
    survey = Survey.create({ :name => "dogs or cats" })
    expect(survey.name).to eq("Dogs Or Cats")
  end
end

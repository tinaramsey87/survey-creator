class CreateSurveysAndQuestions < ActiveRecord::Migration
  def change
    create_table(:surveys) do |t|
      t.column(:name, :string)

      t.timestamps
    end

    create_table(:questions) do |t|
      t.column(:description, :string)
      t.column(:type, :string)
      
      t.timestamps
    end

    create_table(:surveys_questions) do |t|
      t.column(:survey_id, :integer)
      t.column(:question_id, :integer)

      t.timestamps
    end
  end
end

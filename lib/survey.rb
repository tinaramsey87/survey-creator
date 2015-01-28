class Survey < ActiveRecord::Base
  has_many :questions

  before_create :titleize

private

  define_method(:titleize) do
    new_titles = []
    names = self.name.downcase.split(" ")
    names.each do |word|
      new_titles.push(word.capitalize!)
    end
    self.name = new_titles.join(" ")
  end

end

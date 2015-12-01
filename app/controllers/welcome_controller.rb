class WelcomeController < ApplicationController
  def index
    @people = (homepage_people + random_people).uniq
    @sources = Source.order('authority desc').first(10)
  end

  private

  def homepage_people
    Person.where(homepage: true).sort_by(&:name)
  end

  def random_people
    10.times.map do |_|
      Person.offset(rand(Person.count)).first
    end.sort_by(&:name)
  end
end

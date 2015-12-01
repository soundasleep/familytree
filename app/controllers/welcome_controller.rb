class WelcomeController < ApplicationController
  def index
    @people = Person.where(homepage: true).sample(20)
    @sources = Source.order(:authority).first(10)
  end
end

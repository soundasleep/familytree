class PeopleController < ApplicationController
  def show
    @person = find_person
  end

  def new
    @person = Person.new(default_person)
  end

  def create
    person = Person.create!(default_person)

    source = Source.find(params[:source_id])

    fact = person.facts.create!(
      key: "name",
      value: params[:name],
      source: source
    )

    redirect_to person_path(person)
  end

  def toggle_homepage
    person = find_person
    person.update!(homepage: !person.homepage)
    redirect_to person_path(person)
  end

  private

  def default_person
    { homepage: false }
  end

  def find_person
    Person.find(params[:id] || params[:person_id])
  end
end

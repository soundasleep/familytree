class FactsController < ApplicationController
  def create
    person = Person.find(params[:person_id])

    fact = person.facts.create(fact_params)
    fact.source = Source.find(params[:source_id])
    fact.save!

    redirect_to person_path(person)
  end

  def destroy
    fact = Fact.find(params[:id])
    person = fact.person

    Fact.destroy(fact.id)

    redirect_to person_path(person)
  end

  private

  def fact_params
    params.require(:fact).permit(:key, :value, :notes)
  end
end

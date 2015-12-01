class Person < ActiveRecord::Base
  # has_many :facts, -> { joins(:source).order('authority desc') }, dependent: :destroy

  has_many :facts, -> { joins(:source).order(:key).order('authority desc').order(:value) }, dependent: :destroy

  def name
    top_fact_for("name").value
  end

  def top_facts
    facts.select(:key).distinct.map do |key|
      top_fact_for(key)
    end
  end

  def top_fact_for(key)
    facts.joins(:source).order('authority desc').first
  end
end

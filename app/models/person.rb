class Person < ActiveRecord::Base
  has_many :facts, -> { joins(:source).order(:key).order('authority desc').order(:value) }, dependent: :destroy

  def name
    top_fact_for("name") || "(unknown)"
  end

  def date_of_birth
    keyed_date("birth")
  end

  def date_of_death
    keyed_date("death")
  end

  def place_of_birth
    keyed_place("birth")
  end

  def place_of_death
    keyed_place("death")
  end

  def top_facts
    facts.select(:key).distinct.map do |fact|
      facts_for(fact.key).first!
    end
  end

  private

  def keyed_date(key = "birth")
    if top_fact_for("#{key}_date")
      Date.parse(top_fact_for!("#{key}_date"))
    elsif top_fact_for("#{key}_year")
      top_fact_for!("#{key}_year").to_i
    end
  end

  def keyed_place(key = "birth")
    [
      top_fact_for("#{key}_city"),
      top_fact_for("#{key}_country"),
    ].compact.join(" ").titleize
  end

  def facts_for(key)
    facts.joins(:source).order('authority desc').where(key: key)
  end

  def top_fact_for(key)
    if facts_for(key).any?
      facts_for(key).first.value
    else
      nil
    end
  end

  def top_fact_for!(key)
    facts_for(key).first!.value
  end

  def self.fact_keys
    important_fact_keys + other_fact_keys
  end

  def self.important_fact_keys
    [
      :name,
      :birth_date,
      :birth_country,
      :death_date,
      :death_country,
      :occupation,
    ]
  end

  def self.other_fact_keys
    [
      :name_first,
      :name_last,
      :name_middle,

      :birth_year,
      :birth_month,
      :birth_day,
      :birth_city,

      :death_year,
      :death_month,
      :death_day,
      :death_city,
    ]
  end
end

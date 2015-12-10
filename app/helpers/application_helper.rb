module ApplicationHelper
  def all_sources_options
    options_for_select all_sources_as_pairs
  end

  def all_sources
    Source.order(authority: :desc).all
  end

  def all_sources_as_pairs
    all_sources.map do |source|
      [ source.select_text, source.id ]
    end
  end

  def all_person_fact_keys
    options_for_select all_fact_keys_as_pairs
  end

  def all_fact_keys_as_pairs
    Person.fact_keys.map do |k|
      [ k.to_s.humanize, k.to_s ]
    end
  end
end

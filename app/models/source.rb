class Source < ActiveRecord::Base
  validates :key, presence: true, uniqueness: true

  validates :authority, presence: true, numericality: { only_integer: true }

  has_many :facts, dependent: :destroy

  def self.default
    source = new
    source.authority ||= 1
    source
  end

  def select_text
    "#{key} (used by #{facts.length})"
  end
end

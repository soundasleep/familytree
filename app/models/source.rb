class Source < ActiveRecord::Base
  validates :key, presence: true, uniqueness: true

  validates :authority, presence: true, numericality: { only_integer: true }

  def self.default
    source = new
    source.authority ||= 1
    source
  end
end

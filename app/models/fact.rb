class Fact < ActiveRecord::Base
  validates :key, presence: true
  validates :value, presence: true
  validates :source, presence: true

  belongs_to :source
  belongs_to :person
end

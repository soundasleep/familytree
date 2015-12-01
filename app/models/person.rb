class Person < ActiveRecord::Base
  validates :homepage, presence: true
end

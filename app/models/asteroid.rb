class Asteroid < ActiveRecord::Base
  has_many :planets, through: :orbitings
  has_many :orbitings
end

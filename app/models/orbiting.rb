class Orbiting < ActiveRecord::Base
  belongs_to :planet
  belongs_to :asteroid
end

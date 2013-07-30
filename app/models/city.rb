class City < ActiveRecord::Base
  attr_accessible :name, :capital, :state_id
end

class Place < ActiveRecord::Base
  attr_accessible :name

  # Relacionamentos nos quais o lugar possuis usuários com status
  has_many :statuses
  has_many :users, through: :statuses
end

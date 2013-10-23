class Place < ActiveRecord::Base
  attr_accessible :name, :owner_id, :owner_type

  # Relacionamentos nos quais o lugar possuis usuários com status
  has_many :statuses
  has_many :users, through: :statuses

	belongs_to :owner, :polymorphic => true
end

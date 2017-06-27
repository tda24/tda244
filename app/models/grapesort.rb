class Grapesort < ActiveRecord::Base
  has_many :relationships
  has_many :varietywines, inverse_of: :relationships
  validates :name, :place_of_production, :date_of_collection, presence: true

end

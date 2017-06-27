class Relationship < ActiveRecord::Base
  belongs_to :grapesort, inverse_of: :relationships
  belongs_to :varietywine, inverse_of: :relationships
  accepts_nested_attributes_for :grapesort
  validates :ratio, presence: true


end

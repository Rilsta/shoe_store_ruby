class Store < ActiveRecord::Base
  has_and_belongs_to_many(:brands)
  validates(:store_name, :presence => true)
end

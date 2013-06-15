class Item < ActiveRecord::Base
  attr_accessible :brand, :description, :name, :note, :quantity, :unit, :list_id
  belongs_to :list
end

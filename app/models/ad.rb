class Ad < ActiveRecord::Base
  attr_accessible :image_url, :name, :url

  validates :image_url, :name, :url, presence: true
end

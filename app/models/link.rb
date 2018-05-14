class Link < ActiveRecord::Base
  has_many :link_hashtags
  has_many :hashtags, through: :faq_hashtags
  belongs_to :company
end

class Tweet < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true
  validates_length_of :content, maximum: 140
end

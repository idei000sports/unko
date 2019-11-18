class Event < ApplicationRecord
	belongs_to :user
	belongs_to :prefecture, optional: true
	has_many :event_performers
	has_many :images
	has_many :likes

	  def like_by?(user)
	    likes.where(user_id: user.id).exists?

	  end

end

class Comment < ApplicationRecord
	acts_as_paranoid
	validates :name, :comment, presence: true
	validates_length_of :comment, maximum: 50

    belongs_to :post
end

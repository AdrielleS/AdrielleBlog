class Post < ApplicationRecord
	has_many :comments, dependent: :destroy
	acts_as_paranoid
	extend FriendlyId
  	friendly_id :title, use: :slugged
  	has_attached_file :image, styles: { medium: "600x300#", thumb: "200x100#" }
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  	def should_generate_new_friendly_id?
    	title_changed?
  	end

  	

end

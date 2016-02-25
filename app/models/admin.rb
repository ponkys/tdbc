class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :podcasts

	has_attached_file :thumbnail, styles: { large: "700x700#", medium: "500x500#" }
  	validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\Z/
end

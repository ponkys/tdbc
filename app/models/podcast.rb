class Podcast < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :registerable
         

  has_many :episodes
  belongs_to :user

  has_attached_file :thumbnail, styles: { large: "700x700#", medium: "500x500#" }
  validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\Z/
end

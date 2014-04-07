# == Schema Information
#
# Table name: adverts
#
#  id              :integer          not null, primary key
#  title           :string(255)
#  description     :text
#  reverse         :boolean
#  price           :float
#  expiration_date :datetime
#  user_id         :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Advert < ActiveRecord::Base

  belongs_to :user
  has_attached_file :advertphoto, styles: {medium: "486x365>"},
  url: "/assets/adverts/:id/:style/:basename.:extension",
  path: ":rails_root/public/assets/adverts/:id/:style/:basename.:extension"

  validates_attachment_size :advertphoto, less_than: 7.megabytes
  validates_attachment_content_type :advertphoto, content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']

  validates :title, presence: true
  validates :description, presence: true, length:{minimum: 10}
  validates :price, presence: true
end

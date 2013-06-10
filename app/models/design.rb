# == Schema Information
#
# Table name: designs
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :string(255)
#  date        :date
#  size        :string(255)
#  price       :decimal(, )
#  thumbnail   :binary
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Design < ActiveRecord::Base
  belongs_to :user

  attr_accessible :date, :description, :price, :size, :thumbnail, :title, :image_file, :user_id

  validates :date, :price, :thumbnail, :title, :user_id, presence: true
  validates :description, presence: true , length: {minimum: 5}
  validates :size, presence: true, 
                   format: {with: /\d+x\d+/, message: "Please specify size as widthxheight"}

  def image_file=(input_data)
    self.thumbnail = input_data.read
  end

  default_scope order: 'designs.created_at DESC'
end

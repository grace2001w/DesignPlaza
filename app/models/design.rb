class Design < ActiveRecord::Base
  belongs_to :author

  attr_accessible :date, :description, :price, :size, :thumbnail, :title, :image_file

  validates :date, :price, :thumbnail, :title, :presence => true
  validates :description, :presence => true, :length => {:minimum => 5}
  validates :size, :presence => true, 
                   :format => {:with => /\d+ x \d+/, :message => "Please specify size as width x height"}

  def image_file=(input_data)
    self.thumbnail = input_data.read
  end
end

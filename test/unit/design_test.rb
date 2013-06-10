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

require 'test_helper'

class DesignTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

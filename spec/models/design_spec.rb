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

require 'spec_helper'

describe Design do
  let(:user) {FactoryGirl.create(:user)}
  before {@design = user.designs.build(name:"painting 1")}

  subject {@design}

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Design.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

end

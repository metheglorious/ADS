# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe User do
before { @user = User.new(email: "user@example.com", password: "qwerty69", password_confirmation: "qwerty69", remember_me: true) }

  subject { @user }

  it { should respond_to(:email) }
  
  it { should be_valid }
  
  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end
end
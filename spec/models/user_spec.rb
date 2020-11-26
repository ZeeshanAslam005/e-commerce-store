require 'rails_helper'

RSpec.describe User, :type => :model do
  subject {
    described_class.new(
      email: "example@email.com",
      password: "password"
    )
  }

  describe "Associations" do
    it { should belong_to(:user).without_validating_presence }
  end

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end
  end
end

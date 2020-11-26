require 'rails_helper'

RSpec.describe Product, :type => :model do
  user = User.create(:email => 'jane@doe.com', :password => 'pw1234' )


  subject {
    described_class.new(name: "Anything",
                        sku: "Lorem ipsum",
                        user_id: user.id)
  }

  
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
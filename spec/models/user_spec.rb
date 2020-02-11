require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do
    subject {
      described_class.new(first_name: "Dwight", last_name: "Schrute", email: "dwight@dundermifflin.com", 
                          password: "michael", password_confirmation: "michael")
    }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a first name" do
      subject.first_name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("First name can't be blank")
    end

    it "is not valid without a last name" do
      subject.last_name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Last name can't be blank")
    end
  
    it "is not valid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Password can't be blank")
    end

    it "is not valid without password confirmation" do
      subject.password_confirmation = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it "is not valid without a 7-character password" do
      subject.password = "michae"
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Password is too short (minimum is 7 characters)")
    end

    it "is not valid without a 7-character password confirmation" do
      subject.password = "michae"
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
  end

end

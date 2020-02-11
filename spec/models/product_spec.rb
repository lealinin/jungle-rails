require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    subject {
      described_class.new(name: "Chair", price: 180, quantity: 1, category: Category.new)
    }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    #validates :name, presence: true
    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Name can't be blank")
    end
    #validates: price, presence: true
    it "is not valid without a price" do
      subject.price_cents = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Price cents is not a number")
    end
    #validates: quantity, presence: true
    it "is not valid without quantity" do
      subject.quantity = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Quantity can't be blank")
    end
    #validates: category, presence: true
    it "is not valid without category" do
      subject.category = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Category can't be blank")
    end
  end
end

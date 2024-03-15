require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  subject {
    described_class.new(brand: "Wolksvagen",
                        model:"Fuska",
                        year: "1969",
                        license_plate: "ABC1-D23")
  }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it { should validate_presence_of(:brand) }
  it { should validate_presence_of(:model) }
  it { should validate_presence_of(:year) }
  it { should validate_presence_of(:license_plate) }
  it { should validate_uniqueness_of(:license_plate) }
end

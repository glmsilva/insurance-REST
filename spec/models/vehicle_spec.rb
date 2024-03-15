require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  subject {
    described_class.new(brand: "Volkswagen",
                        model:"Fusca",
                        year: "1969",
                        license_plate: "ABC1-D23")
  }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without brand' do
    subject.brand = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without model' do
    subject.model = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without year' do
    subject.year = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without license_plate' do
    subject.license_plate = nil
    expect(subject).to_not be_valid
  end
end

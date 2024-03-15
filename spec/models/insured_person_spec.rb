require 'rails_helper'

RSpec.describe InsuredPerson, type: :model do
  subject {
    described_class.new(name: "Zlatan Ibrahimovic",
                        cpf: "123.456.789-10")
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it 'is not valid without name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without cpf' do
    subject.cpf = nil
    expect(subject).to_not be_valid
  end

  # describe 'validations' do
  #   it { should validates_presence_of(:name) }
  # end

end

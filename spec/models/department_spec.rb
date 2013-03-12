require 'spec_helper'

describe Department do
  subject { Fabricate :department }
  it { should embed_many :homepage_docs }
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should have_many :courses }
  
  context "Fabrication" do
    it "fabricates a validate department" do
      expect(Fabricate(:department)).to be_valid
    end
  end
end

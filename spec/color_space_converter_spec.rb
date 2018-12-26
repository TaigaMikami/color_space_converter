require 'spec_helper'

RSpec.describe ColorSpaceConverter do
  it "has a version number" do
    expect(ColorSpaceConverter::VERSION).not_to be nil
  end

  context '#new' do
    let(:cs) { ColorSpaceConverter.new('rgb') }
    it 'When there is no rgb value, it will be [0,0,0]' do
      expect(cs.rgb).to eq [0, 0, 0]
    end
  end
end

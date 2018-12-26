require 'spec_helper'

RSpec.describe ColorSpaceConverter::ColorSpace do
  context "#new('rgb', 128, 128, 128)" do
    let(:cs) { ColorSpaceConverter::ColorSpace.new('rgb', 128, 128, 128) }

    context 'objecrt' do
      it { expect(cs).to be_an_instance_of(ColorSpaceConverter::ColorSpace) }
    end

    context '@rgb' do
      it { expect(cs.rgb).to eq ([128, 128, 128])}
    end
  end
end
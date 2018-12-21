require 'spec_helper'

RSpec.describe ColorSpaceConverter::Compute do
  let(:cs) { ColorSpaceConverter::Compute }
  context '#rgb2hex' do
    subject { cs.rgb2hex(0, 0, 0)}
    it { expect(subject).to eq('#000000')}
  end

  context '#hex2rgb' do
    subject { cs.hex2rgb('#000000')}
    it { expect(subject).to eq([0, 0, 0])}
  end
end

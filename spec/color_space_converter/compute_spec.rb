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

  context '#rgb2xyz' do
    subject { cs.rgb2xyz(128, 128, 128)}
    it { expect(subject).to eq([20.51754053582612, 21.586050011389922, 23.507208462403632]) }
  end

  context '#xyz2rgb' do
    subject { cs.xyz2rgb(20.51754053582612, 21.586050011389922, 23.507208462403632)}
    it { expect(subject).to eq([128, 128, 128]) }
  end
end

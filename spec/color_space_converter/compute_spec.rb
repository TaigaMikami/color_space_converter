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

  context '#xyz2lab' do
    subject { cs.xyz2lab(19.83, 15.79, 31.53, x_n: 95.039, y_n: 100, z_n: 108.880)}
    it 'D65光源での変換' do
      expect(subject).to eq([46.69776107902747, 26.309470681304237, -24.219332251422145])
    end
  end

  context '#lab2xyz' do
    subject { cs.lab2xyz(46.69, 26.3, -24.21, x_n: 95.039, y_n: 100, z_n: 108.880)}
    it { expect(subject).to eq([19.8213907158935, 15.78413700265745, 31.513765784816886]) }
  end
end

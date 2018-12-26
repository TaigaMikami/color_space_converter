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

    context '@xyz' do
      subject { cs.calc_xyz }
      before { subject }
      it { expect(cs.xyz).to eq ([20.51754053582612, 21.586050011389922, 23.507208462403632]) }
    end

    context '@lab' do
      let(:x_n) { 95.039 }
      let(:y_n) { 100 }
      let(:z_n) { 108.880 }
      subject { cs.calc_lab(x_n: x_n, y_n: y_n, z_n: z_n) }
      before { subject }
      it { expect(cs.lab).to eq ([53.58501345216902, 0.011571257239550992, -0.007345506730205287])}
    end

    context '#calc_rgb' do
      it { expect(cs.calc_rgb).to eq ([128, 128, 128])}
    end

    context '#calc_xyz' do
      it { expect(cs.calc_xyz).to eq ([20.51754053582612, 21.586050011389922, 23.507208462403632])}
    end

    context '#calc_lab' do
      it { expect(cs.calc_lab(x_n: 95.039, y_n: 100, z_n: 108.880)).to eq ([53.58501345216902, 0.011571257239550992, -0.007345506730205287])}
    end
  end
end
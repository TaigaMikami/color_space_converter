require 'spec_helper'

RSpec.describe ColorSpaceConverter::Const do
  context 'ERROR_USAGE' do
    it do
      expect(ColorSpaceConverter::Const::ERROR_USAGE).to \
      eq '[USAGE] `ColorSpaceConverter.new(color_space, e1(r), e2(g), e3(b)`'
    end
  end
end
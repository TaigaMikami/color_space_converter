require "color_space_converter/version"
require "color_space_converter/color_space"
require "color_space_converter/compute"

module ColorSpaceConverter
  class Error < StandardError; end

  def self.new(space = ARGV[0], e1 = ARGV[1], e2 = ARGV[2], e3 = ARGV[3])
    space ||= 'rgb'
    e1 ||= 0
    e2 ||= 0
    e3 ||= 0
    return ColorSpaceConverter::ColorSpace.new(space, e1, e2, e3)
  end
end

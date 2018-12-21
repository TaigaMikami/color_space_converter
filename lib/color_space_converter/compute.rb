module ColorSpaceConverter
  module Compute
    module_function

    def rgb2hex(r, g, b)
      hex = '#'
      [r, g, b].each do |n|
        hex += n.to_s(16).rjust(2, '0')
      end
      hex
    end

    def hex2rgb(hex)
      r = hex[1..2]
      g = hex[3..4]
      b = hex[5..6]
      ints = []
      [r, g, b].each do |s|
        ints << s.hex
      end
      ints
    end
  end
end
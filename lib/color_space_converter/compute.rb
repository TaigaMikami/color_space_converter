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
      rgb = []
      [r, g, b].each do |s|
        rgb << s.hex
      end
      rgb
    end

    def rgb2xyz(r, g, b)
      s_rgb = []
      [r, g, b].each do |n|
        n = n.to_f / 255
        if n <= 0.0405
          s_n = n / 12.92
        else
          s_n = ((n+0.055) / 1.055) ** 2.4
        end
        s_rgb << s_n
      end

      x = s_rgb[0]*0.4124 + s_rgb[1]*0.3576 + s_rgb[2]*0.1805
      y = s_rgb[0]*0.2126 + s_rgb[1]*0.7152 + s_rgb[2]*0.0722
      z = s_rgb[0]*0.0193+ s_rgb[1]*0.1192+ s_rgb[2]*0.9505
      [x*100, y*100, z*100]
    end

    def xyz2rgb(x, y, z)
      x = x / 100
      y = y / 100
      z = z / 100

      s_r = 3.2406*x-1.5372*y-0.4986*z
      s_g = -0.9689*x+1.8758*y+0.0415*z
      s_b = 0.0557*x-0.2040*y+1.0570*z

      rgb = []
      [s_r, s_g, s_b].each do |s_n|
        if s_n <= 0.0031308
          n = s_n * 12.92
        else
          n = 1.055 * (s_n**(1.0/2.4)) - 0.055
        end
        rgb << (n*255).to_i
      end
      rgb
    end
  end
end
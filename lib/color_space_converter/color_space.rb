require 'color_space_converter/compute'
require 'color_space_converter/const'

module ColorSpaceConverter
  class ColorSpace
    attr_reader :rgb, :xyz, :lab, :hex

    include ColorSpaceConverter::Compute

    def initialize(space, e1, e2, e3)
      @init_space = space
      if space == 'rgb'
        @rgb = [e1, e2, e3]
      elsif space == 'xyz'
        @xyz = [e1, e2, e3]
      elsif space == 'lab'
        @lab = [e1, e2, e3]
      else
        @init_space = ''
        puts ColorSpaceConverter::Const::ERROR_USAGE
      end
    end

    def calc_rgb(x_n: 100, y_n: 100, z_n: 100)
      if @xyz
        @rgb = xyz2rgb(@xyz[0], @xyz[1], @rgb[2])
      elsif @lab
        @lab = lab2rgb(@lab[0], @lab[1], @lab[2], x_n: x_n, y_n: y_n, z_n: z_n)
      end
    end

    def calc_xyz(x_n: 100, y_n: 100, z_n: 100)
      if @rgb
        @xyz = rgb2xyz(@rgb[0], @rgb[1], @rgb[2])
      elsif @lab
        @xyz = lab2xyz(@lab[0], @lab[1], @lab[2], x_n: x_n, y_n: y_n, z_n: z_n)
      end
    end

    def calc_lab(x_n: 100, y_n: 100, z_n: 100)
      if @rgb
        @lab = rgb2lab(@rgb[0], @rgb[1], @rgb[2], x_n: x_n, y_n: y_n, z_n: z_n)
      elsif @xyz
        @lab = xyz2lab(@xyz[0], @xyz[1], @xyz[2], x_n: x_n, y_n: y_n, z_n: z_n)
      end
    end
  end
end
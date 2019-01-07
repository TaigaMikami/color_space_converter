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

    def xyz2lab(x, y, z, x_n: 100.0, y_n: 100.0, z_n: 100.0)
      xyz_n = [x_n, y_n, z_n]
      f_xyz = []
      [x, y, z].each_with_index do |n, i|
        if n/xyz_n[i] < 0.008856
          f = (903.3*n/xyz_n[i]+16)/116
        else
          f = (n/xyz_n[i])**(1.0/3.0)
        end
        f_xyz << f
      end
      l = 116*f_xyz[1] - 16
      a = 500*(f_xyz[0]-f_xyz[1])
      b = 200*(f_xyz[1]-f_xyz[2])
      [l, a, b]
    end

    def lab2xyz(l, a, b, x_n: 100.0, y_n: 100.0, z_n: 100.0)
      xyz_n = [x_n, y_n, z_n]
      xyz = []

      if l > 903.3*0.008856
        y = ((l+16)/116)**3
      else
        y = l/903.3
      end

      if y > 0.008856
        fy = (l+16)/116
      else
        fy = (903.3*y+16)/116
      end

      fx =  a/500 + fy
      fz = fy - b/200

      if fz**3 > 0.008856
        x = fx**3
      else
        x = (116*fx-16)/903.3
      end

      if fz**3 > 0.008856
        z = fz**3
      else
        z = (116*fz-16)/903.3
      end

      [x, y, z].each_with_index do |n, i|
        xyz << xyz_n[i] * n
      end
      xyz
    end

    def rgb2lab(r, g, b, x_n: 100.0, y_n: 100.0, z_n: 100.0)
      x, y, z = rgb2xyz(r, g, b)
      xyz2lab(x, y, z, x_n: x_n, y_n: y_n, z_n: z_n)
    end

    def lab2rgb(l, a, b, x_n: 100.0, y_n: 100.0, z_n: 100.0)
      x, y, z = lab2xyz(l, a, b, x_n: x_n, y_n: y_n, z_n: z_n)
      xyz2rgb(x, y, z)
    end

    def rgb2hsv(r, g, b)
      max = [r, g, b].max
      min = [r, g, b].min
      h = 0.0
      s = 0.0
      v = max.to_f

      if max != min
        if max == r
          h = (b-g).to_f/(max-min) * 60
        elsif max == g
          h = (2 + (r-b).to_f/(max-min)) * 60
        elsif max == b
          h = (4 + (g-r).to_f/(max-min)) * 60
        end
        s = (max - min).to_f/ max
      end

      if h < 0
        h += 360
      end
      h = h.round
      s = (s*100).round
      v = ((v/255)*100).round
      [h, s, v]
    end

    def hsv2rgb(h, s, v)
      rgb = []
      max = v
      min = max - ((s.to_f/255)*max)
      h = 0 if h == 360
      s = s.to_f / 100
      v = v.to_f / 100

      if s == 0
        r = v * 255
        g = v * 255
        b = v * 255
        return [r.to_i, g.to_i, b.to_i]
      end

      dh = h.to_f / 60
      p = v * (1 - s)
      q = v * (1 - s * (h.to_f / 60 - dh))
      t = v * (1 - s * (1 - (h.to_f / 60 - dh)))

      case dh
      when 0
        r = v; g = t; b = p;
      when 1
        r = q; g = v; b = p;
      when 2
        r = p; g = v; b = t;
      when 3
        r = p; g = q; b = v;
      when 4
        r = t; g = p; b = v;
      when 5
        r = v; g = p; b = q;
      end

      [r, g, b].each do |n|
        rgb << (n * 255).round
      end
      rgb
    end
  end
end

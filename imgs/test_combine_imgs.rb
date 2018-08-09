# Instalar o ImageMagick no Windows, baixar p exe abaixo e depois instalar a gem com os caminhos, tem q ser a mesma versao de plataforma ruby x86
# http://ftp.icm.edu.pl/packages/ImageMagick/binaries/ImageMagick-6.9.6-8-Q16-HDRI-x86-dll.exe
# gem install rmagick --platform=ruby -- '--with-opt-dir="C:/Program Files (x86)/ImageMagick-6.9.6-Q16-HDRI/lib"' --with-opt-include="C:/Program Files (x86)/ImageMagick-6.9.6-Q16-HDRI/include"

require 'rmagick'
path = __dir__
image_list = Magick::ImageList.new("#{path}/imgs/results_1.png", "#{path}/imgs/results_2.png", "#{path}/imgs/results_3.png")
image_list.append(true).write("#{path}/imgs/combine.png")

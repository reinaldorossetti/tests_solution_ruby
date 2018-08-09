# Instalar o ImageMagick no Windows, baixar p exe abaixo e depois instalar a gem com os caminhos, tem q ser a mesma versao de plataforma ruby x86
# http://ftp.icm.edu.pl/packages/ImageMagick/binaries/ImageMagick-6.9.6-8-Q16-HDRI-x86-dll.exe
# gem install rmagick --platform=ruby -- '--with-opt-dir="C:/Program Files (x86)/ImageMagick-6.9.6-Q16-HDRI/lib"' --with-opt-include="C:/Program Files (x86)/ImageMagick-6.9.6-Q16-HDRI/include"

require 'rmagick'
require 'base64'

$path = __dir__
$img_path = "#{$path}/imgs/combine.png"
$encoded_img = nil

  # Pega a imagem em base64 combinada pra fazer o embed no Cucumber
  def img64
    File.open($img_path, 'rb') do |img|
        $encoded_img = Base64.strict_encode64(img.read)
    end
  end

  # Combina as imagens.
  def combine(array)
    image_list = Magick::ImageList.new
    array.each{|img|
        image_list.push(Magick::Image.read(img).first)
    }
    image_list.append(true).write($img_path)
  end

imgs = ["#{$path}/imgs/results_1.png", "#{$path}/imgs/results_2.png", "#{$path}/imgs/results_3.png"]
combine(imgs)
p img64


# No Hooks no BDD
# embed("data:image/png;base64,#{$encoded_img}", 'image/png')

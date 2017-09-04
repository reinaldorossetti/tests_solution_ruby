require 'rtesseract'

image = RTesseract.new('C:\Users\reinaldo.rossetti\Pictures\imagem006.png')
puts image.to_s # Getting the value


print(pytesseract.image_to_string(Image.open('C:\Users\reinaldo.rossetti\Pictures\imagem006.png'), lang='por'))

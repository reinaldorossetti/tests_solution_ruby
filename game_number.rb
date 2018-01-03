class AdivinharNumero
	attr_accessor :numero
	attr_accessor :venceu

	def initialize
		numero = Random.new
		@numero = numero.rand(1..10)
		@venceu = false
	end

	def tentar_adivinhar(numero=0)
		#p @numero
		case 
		when numero==@numero then
			@venceu = true
			return "Você Venceu!!!"
		when @numero>numero then
			return "Opa o numero é maior.\n"
		else
			return "Opa o numero é menor.\n"
		end
	end
end

jogo = AdivinharNumero.new
vezes = 5
count=0
vezes.times { |index|
	puts "\nDigite um número"
	numero = gets.to_i
	puts jogo.tentar_adivinhar(numero)
	break if jogo.venceu
	puts "Você tem ainda #{vezes-(index+1)} tentativas"
}
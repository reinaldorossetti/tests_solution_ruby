# encoding: UTF-8
require_relative 'desconto'

include DataBase

# adicionando novo valor.
p values(["E",10, 5, 40])
p values(["E",10, 5, 40]) # teste com valores repetidos.
test = Account.new

list = [[0, ""],[50, "A"],[80, "AB"], [115, "CDBA"], [100, "AA"], [130, "AAA"],[180, "AAAA"],
[230, "AAAAA"], [260,"AAAAAA"], [160, "AAAB"], [175, "AAABB"],[190, "AAABBD"], [190, "DABABA"]]

new_array = list.map{|array| array.reverse}
new_array.each{ |array|
	to_array(array[0])
  	p test.apply_values # sem desconto.
  	p result = test.apply_desc # com desconto.
	p comparacao = (result.map{|arr| arr[1] }).sum==array[1] # meu teste unitario comparando com o valor do array.
	raise "O Teste Unitário Falhou!!!" unless comparacao
}
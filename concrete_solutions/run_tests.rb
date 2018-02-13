# encoding: UTF-8
require_relative 'desconto'

class UnitTest

  include DataBase

  def initialize
    @test = Account.new
  end

  # adicionando novo valor.
  def add_values(list)
    p values(list)
  end

  # faz o assert da lista de dados.
  def assert_values(list)
    new_array = list.map {|array| array.reverse}
    new_array.each {|array|
      to_array(array[0]) # envia os itens para calcular o valor.
      p @test.apply_values # sem desconto.
      p result = @test.apply_desc # com desconto.
      result.empty? ? list = 0 : list = (result.map {|arr| arr[1]}).reduce(:+)
      p comparacao = (list)==array[1] # meu teste unitario comparando com o valor do array.
      raise "O Teste Unitário Falhou!!!" unless comparacao
    }
  end
end

test = UnitTest.new
test.add_values(["E", 10, 5, 40])
list = [[0, ""], [50, "A"], [80, "AB"], [115, "CDBA"], [100, "AA"], [130, "AAA"], [180, "AAAA"],
        [230, "AAAAA"], [260, "AAAAAA"], [160, "AAAB"], [175, "AAABB"], [190, "AAABBD"], [190, "DABABA"]]

test.assert_values(list)

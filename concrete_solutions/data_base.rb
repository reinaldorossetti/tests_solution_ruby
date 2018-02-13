# encoding: UTF-8
module DataBase

  # Simulando uma lista de uma base, item, valor, quant_d, valor_desconto
  def values(new_value)
    $array_m = [["A", 50, 3, 130],
                ["B", 30, 2, 45],
                ["C", 20, 0, 0],
                ["D", 15, 0, 0]]

    $array_m.push(new_value).uniq! # insere e remove valores repetidos.
    $itens = $array_m.transpose[0]
    $values = $array_m.transpose[1]
    $desc_q_min = $array_m.transpose[2].reject(&:zero?).min
    $array_m
  end

  # convert string to array of itens.
  def to_array(string)
    string.gsub!(/[^A-Za-z]/, '') if string.is_a?(String) # somente letras se for str.
    string.split('').to_a if string.is_a?(String) # converte p array se for str.
    to_quantity(string)
  end

  # get quantity of itens in list.
  def to_quantity(array)
    $array_quant = []
    $itens.each {|item| $array_quant << [item, array.count(item)] if array.count(item) > 0}
    $itens_em_desc = $array_m.reject {|array| array[2]==0}
    $prod_com_d, $prod_sem_d = $array_quant.partition {|array| array[1]>=$desc_q_min}
    $array_quant
  end
end

module DataBase

  def values(new_value)
    # Simulando uma lista de uma base, item, valor, quant_d, valor_desconto
    $array_m = [["A", 50, 3, 130],
                ["B", 30, 0, 0],
                ["C", 20, 0, 0],
                ["D", 15, 5, 50]]
                
    $array_m.push(new_value)
    $itens = $array_m.transpose[0]
    $values = $array_m.transpose[1]
    $desc_q_min = ($array_m.transpose[2].reject!{|x| x==0}).min
    $array_m
  end
# convert string to array of itens.
  def to_array(string)
    string.split('').to_a if string.is_a?(String)
    to_quantity(string)
  end

# get quantity of itens in list.
  def to_quantity(array)
    $array_quant = []
    $itens.each {|item| $array_quant << [item, array.count(item)] if array.count(item) > 0}
    $itens_em_desc = $array_m.reject {|array| array[2]==0}
    $prod_com_d,$prod_sem_d = $array_quant.partition{|array| array[1]>=$desc_q_min}
    $array_quant
  end
end
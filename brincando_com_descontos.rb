# Simulando uma lista de uma base, item, valor, quant_d, valor_desconto
$array_m = [["A", 50, 3, 130],
            ["B", 30, 0, 0],
            ["C", 20, 0, 0],
            ["D", 15, 5, 50]
]
$itens = $array_m.transpose[0]
$values = $array_m.transpose[1]

# convert string to array of itens.
def to_array(string)
  string.split('').to_a if string.is_a?(String)
  to_quantity(string)
end

# get quantity of itens in list.
def to_quantity(array)
  $array_quant = []
  $itens.each {|item| $array_quant << [item, array.count(item)] if array.count(item) > 0}
end

def apply_values
  dic_values = Hash[$itens.zip($values)]
  $array_quant.each_with_index {|array, index_q|
    array.each_with_index {|item, index_i|
      dic_values.each {|key, value|
        $array_quant[index_q].insert(1, value*(array[1])) if key == item
      }
    }
  }
end

def apply_desc
  # pegar os itens que estão em desconto.
  itens = $array_m.reject {|array| array[2]==0}
  $array_quant.each_with_index {|array, index_q|
    array.each_with_index {|item, index_i|
      itens.each_with_index {|array2|
        if array2[0]==array[0] and array[2]>=array2[2]
          desconto = (array2[3].to_f/array2[2].to_f)/array2[1].to_f
          quant = (array[2]/array2[2]).divmod 1
          array[1] = (((array2[1]*array2[2])*quant[0])*desconto).to_i+(array2[1]+(array2[2]*quant))
        end
      }
    }
  }
end

array = to_array("AAAAAABCDDDDDDDDD")
p $array_quant
p $array_m
p apply_values
p apply_desc

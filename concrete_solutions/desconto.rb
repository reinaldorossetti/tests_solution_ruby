require_relative 'data_base'

class Account

  include DataBase

  def apply_values
    dic_values = Hash[$itens.zip($values)]
    $array_quant.each_with_index {|array, index_q|
      array.each_with_index {|item, index_i|
        dic_values.each {|key, value|
          $array_quant[index_q].insert(1, value*(array[1])) if key == item
        }}
    }
  end

  def apply_desc
    # pegar os itens que estão em desconto.
    itens = $array_m.reject {|array| array[2]==0}
    $array_quant.each {|array|
      array.each_with_index {
        itens.each_with_index {|array_itens|
          if array_itens[0]==array[0] and array[2]>=array_itens[2]
            # calcula o valor em porcentagem do desconto.
            desconto = (array_itens[3].to_f/array_itens[2].to_f)/array_itens[1].to_f
            quant = (array[2]/array_itens[2]).floor
            itens_sem_desc = array[2]-(array_itens[2]*quant)
            valor_unit = array_itens[1]
            valor_com_desc = (((array_itens[1]*array_itens[2])*quant)*desconto).to_i
            array[1] = valor_com_desc+(valor_unit*itens_sem_desc)
          end
        }}
    }
  end
end
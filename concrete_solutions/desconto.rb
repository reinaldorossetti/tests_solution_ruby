require_relative 'data_base'

class Account

  include DataBase

  def apply_values
    dic_values = Hash[$itens.zip($values)]
    $array_quant.each_with_index {|array, index_q|
      array.each {|item|
        dic_values.each {|key, value|
          $array_quant[index_q].insert(1, value*(array[1])) if key == item
        }}
    }
  end

  def apply_desc
    # pegar os itens que estão em desconto.
    # calcula o valor em porcentagem do desconto..
    $prod_com_d.map { |array|
        $itens_em_desc.each{|item_desc|
          if item_desc[0]==array[0]
            desconto = (item_desc[3].to_f/item_desc[2].to_f)/item_desc[1].to_f
            quant = (array[2]/item_desc[2]).floor
            itens_sem_desc = array[2]-(item_desc[2]*quant)
            valor_unit = item_desc[1]
            valor_com_desc = (((item_desc[1]*item_desc[2])*quant)*desconto).to_i
            array[1] = valor_com_desc+(valor_unit*itens_sem_desc)
          end
        }
    } 
    $prod_com_d.concat($prod_sem_d).sort!
  end
end
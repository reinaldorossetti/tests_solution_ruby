  
  def element_has_locator?(element)
    query = element.instance_variable_get(:@query)
    locator = query.locator
    result = page.has_selector?(locator, :all, true, :wait=>60)
    # p "Locator Encontrado: #{result}"
    result
  end

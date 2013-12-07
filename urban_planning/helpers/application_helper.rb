RnelOrg::UrbanPlanning.helpers do
  def hb_class_for(cell)
    if 1 == cell
      'house'
    else
      'business'
    end
  end

  def hb_for(cell)
    if 1 == cell
      'H'
    else
      'B'
    end
  end
end

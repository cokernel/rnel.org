RnelOrg::UrbanPlanning.helpers do
  def hb_class_for(cell)
    if 1 == cell
      'fa fa-home cell house'
    else
      'fa fa-suitcase cell business'
    end
  end
end

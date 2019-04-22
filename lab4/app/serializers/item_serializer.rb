class ItemSerializer < ActiveModel::Serializer
  attributes  :item_name ,:item_description 
  
  def item_description
    object.description
  end

  def item_name
    object.name
  end

end


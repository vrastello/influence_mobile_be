# frozen_string_literal: true

class BaseJsonSerializer
  include JSONAPI::Serializer

  def serializable_attributes
    serializable_hash.dig(:data, :attributes)
  end

  def serialize_with_root(root: nil)
    return serializable_attributes if root.blank?

    { root.to_sym => serializable_attributes }
  end

  def self.serialize_collection_with_root(root: nil, collection:)
    serialized_collection = collection.map { |item| new(item).serializable_attributes }
    return serialized_collection if root.blank?

    { root => serialized_collection }
  end
end

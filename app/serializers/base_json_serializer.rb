# frozen_string_literal: true

class BaseJsonSerializer
  include JSONAPI::Serializer

  def serializable_attributes
    serializable_hash.dig(:data, :attributes)
  end

  def self.serialize_collection(collection:)
    collection.map { |item| new(item, params: params).serializable_attributes }
  end
end

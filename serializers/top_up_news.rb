class TopUpNewsSerializer < ActiveModel::Serializer
  attributes :id, :title, :announcement, :context, :created
end

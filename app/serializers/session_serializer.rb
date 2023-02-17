class SessionSerializer < ActiveModel::Serializer
  attributes :id, :username, :image_url, :bio
end

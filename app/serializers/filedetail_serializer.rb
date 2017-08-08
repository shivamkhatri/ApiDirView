class FiledetailSerializer < ActiveModel::Serializer
  attributes :id, :name, :path, :owner, :ptype
end

class DirdetailSerializer < ActiveModel::Serializer
  attributes :id, :name, :path, :parent
end

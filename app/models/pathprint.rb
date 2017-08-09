class Pathprint < ApplicationRecord

  has_many :subdirs , class_name: 'Pathprint' , foreign_key: 'pathprint_id'
  belongs_to :dir , class_name:'Pathprint' , foreign_key: 'pathprint_id' , optional: true#dbinit

  validates :path , uniqueness: true

end

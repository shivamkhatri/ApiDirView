class Filedetail < ApplicationRecord
  belongs_to :dirdetail, required: true
end

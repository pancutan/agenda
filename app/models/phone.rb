class Phone < ApplicationRecord
  belongs_to :user
  belongs_to :type
  validates_presence_of :telefono, :type_id, :user_id
end

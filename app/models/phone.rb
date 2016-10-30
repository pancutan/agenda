class Phone < ApplicationRecord
  belongs_to :user
  belongs_to :type
  validates_presence_of :telefono, :user_id, :type_id
end

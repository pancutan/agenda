class User < ApplicationRecord
  has_many :phones, :dependent => :destroy, :validate => :false
  validates_presence_of :email
  validates_presence_of :province_id

  belongs_to :province

  has_secure_password

end

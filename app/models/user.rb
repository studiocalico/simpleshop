class User < ActiveRecord::Base
  has_many :orders, dependent: :nullify
end
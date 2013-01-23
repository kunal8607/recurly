class User < ActiveRecord::Base
  attr_accessible :account_code, :email, :first_name, :last_name
end

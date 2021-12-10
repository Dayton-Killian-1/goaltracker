# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  number          :string
#  password_digest :string
#  phone           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord

  validates(:name,
    {
      :presence => true,
      :uniqueness => { :case_sensitive => false }
    }
  )

  has_secure_password
  
  has_many(:goals, { :class_name => "Goal", :foreign_key => "user_id"})


end

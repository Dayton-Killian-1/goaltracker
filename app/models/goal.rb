# == Schema Information
#
# Table name: goals
#
#  id            :integer          not null, primary key
#  completed     :integer
#  description   :text
#  due_date      :datetime
#  public        :integer
#  status        :integer
#  target_number :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#
class Goal < ApplicationRecord

  belongs_to(:user)

  validates(:description, { :presence => true})
  validates(:target_number, { :presence => true})
  validates(:completed, { :presence => true})
  validates(:status, { :presence => true})
  validates(:public, { :presence => true})

  def owner
    key = self.user_id
    the_owner = User.where({ :id => key })
    return the_owner.at(0).name
  end



  

end

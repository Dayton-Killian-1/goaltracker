# == Schema Information
#
# Table name: goals
#
#  id            :integer          not null, primary key
#  completed     :integer
#  description   :text
#  due_date      :datetime
#  public        :integer
#  target_number :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#
class Goal < ApplicationRecord

  def owner
    key = self.user_id
    the_owner = User.where({ :id => key })
    return the_owner.at(0).name
  end



  

end

class GoalsController < ApplicationController

  def index
    @user = User.where({ :id => session.fetch(:user_id) }).at(0)
    matching_goals = Goal.all.order({ :user_id => :asc , :status => :asc})
    @list_of_user_goals = matching_goals.where({ :user_id => session.fetch(:user_id) })
    all_nonuser_goals = matching_goals.where.not({ :user_id => session.fetch(:user_id)})
    @nonuser_goals = all_nonuser_goals.where({ :public => 1 })
    render({ :template => "goal_templates/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_goals = Goal.where({ :id => the_id })
    @the_goal = matching_goals.at(0)
    user_num = matching_goals.at(0).user_id
    @the_owner = User.where({ :id => user_num }).at(0).name

    render({ :template => "goal_templates/show.html.erb" })
  end

  def update_page
    the_id = params.fetch("path_id")

    matching_goals = Goal.where({ :id => the_id })
    @the_goal = matching_goals.at(0)
    user_num = matching_goals.at(0).user_id
    @the_owner = User.where({ :id => user_num }).at(0).name

    render({ :template => "goal_templates/update_page.html.erb"})
  end

  def update_description
    the_id = params.fetch("path_id")
    new_value = params.fetch("input_update")
    goal = Goal.where({ :id => the_id}).at(0)
    goal.description = new_value
    goal.save
    redirect_to("/goals/#{goal.id}")
  end

  def update_target_number
    the_id = params.fetch("path_id")
    new_value = params.fetch("input_update")
    goal = Goal.where({ :id => the_id}).at(0)
    goal.target_number = new_value
    goal.save
    redirect_to("/goals/#{goal.id}")
  end

  def update_completed
    the_id = params.fetch("path_id")
    new_value = params.fetch("input_update")
    goal = Goal.where({ :id => the_id}).at(0)
    goal.completed = new_value
    goal.save
    redirect_to("/goals/#{goal.id}")
  end

  def update_public
    the_id = params.fetch("path_id")
    new_value = params.fetch("input_update")
    goal = Goal.where({ :id => the_id}).at(0)
    goal.public = new_value
    goal.save
    redirect_to("/goals/#{goal.id}")
  end

  def update_due_date
    the_id = params.fetch("path_id")
    new_value = params.fetch("input_update")
    goal = Goal.where({ :id => the_id}).at(0)
    goal.due_date = new_value
    goal.save
    redirect_to("/goals/#{goal.id}")
  end


  def new
    if session.fetch(:user_id) == nil
      redirect_to("/user_sign_in", { :alert => "Please sign in so you can create a new goal."})
    else
      render({ :template => "goal_templates/new.html.erb"})
    end
  end

  def create
    user_id = session.fetch(:user_id)
    description = params.fetch("input_goal")
    target = params.fetch("input_target")
    completed = params.fetch("input_completed")
    date = params.fetch("input_date")
    if params.fetch("input_public").present? == false
      pub = 0
    else
      pub = params.fetch("input_public")
    end
    goal = Goal.new
    goal.user_id = user_id
    goal.description = description
    goal.target_number = target
    goal.completed = completed
    goal.due_date = date
    goal.public = pub
    if completed.to_i >= target.to_i
      goal.status = 1
    else
      goal.status = 0
    end
    goal.save
    redirect_to("/goals/#{goal.id}")
  end

  def record
    form_id = params.fetch("input_record_goal")
    goal = Goal.where({ :id => form_id }).at(0)
    goal.completed = goal.completed + 1
    if goal.completed >= goal.target_number
      goal.status = 1
    end
    goal.save
    redirect_to("/goals")
  end

  def destroy
    goal_id = params.fetch("path_id")
    goal = Goal.where({ :id => goal_id }).at(0)

    goal.destroy

    redirect_to("/goals")
  end



end
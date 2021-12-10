class GoalsController < ApplicationController

  def index
    matching_goals = Goal.all
    @list_of_user_goals = matching_goals.where({ :user_id => session.fetch(:user_id) })
    all_nonuser_goals = matching_goals.where.not({ :user_id => session.fetch(:user_id)})
    @nonuser_goals = all_nonuser_goals.where({ :public => 1 })
    render({ :template => "goal_templates/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_goals = Goal.where({ :id => the_id })
    @the_goal = matching_goals.at(0)

    render({ :template => "goal_templates/show.html.erb" })
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
    pub = params.fetch("input_public")
    goal = Goal.new
    goal.user_id = user_id
    goal.description = description
    goal.target_number = target
    goal.completed = completed
    goal.due_date = date
    goal.public = pub
    if completed >= target
      goal.status = 1
    else
      goal.status = 0
    end
    goal.save
    redirect_to("/goals/#{goal.id}")
  end


end
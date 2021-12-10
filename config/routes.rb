Rails.application.routes.draw do

  get("/", { :controller => "goals", :action => "index" })

  get("/goals", { :controller => "goals", :action => "index" })
  get("/goals/new_goal", { :controller => "goals", :action => "new" })
  get("/goals/record_goal", { :controller => "goals", :action => "record" })
  get("/goals/:path_id", { :controller => "goals", :action => "show" })

 


  get("/delete_goal/:path_id", { :controller => "goals", :action => "destroy" })
  get("/insert_goal", { :controller => "goals", :action => "create" })
  get("/edit_goal/:path_id", { :controller => "goals", :action => "update_page" })

  get("/update_goal_description/:path_id", { :controller => "goals", :action => "update_description" })
  get("/update_goal_target_number/:path_id", { :controller => "goals", :action => "update_target_number" })
  get("/update_goal_completed/:path_id", { :controller => "goals", :action => "update_completed" })
  get("/update_goal_due_date/:path_id", { :controller => "goals", :action => "update_due_date" })
  get("/update_goal_public/:path_id", { :controller => "goals", :action => "update_public" })


  get("/user_sign_up", { :controller => "users", :action => "new_registration_form" }) 
  get("/user_sign_out", { :controller => "users", :action => "remove_cookies" }) 
  get("/user_sign_in", { :controller => "users", :action => "new_session_form" }) 
  post("/verify_credentials", { :controller => "users", :action => "verify"})


  get("/users", { :controller => "users", :action => "index" })
  get("/users/:the_username", { :controller => "users", :action => "show" })
  get("/delete_user/:path_id", { :controller => "users", :action => "destroy" })
  get("/insert_user_record", { :controller => "users", :action => "create" })
  get("/modify_user/:path_id", { :controller => "users", :action => "update" })
end

Rails.application.routes.draw do

  get("/", { :controller => "goals", :action => "index" })

  get("/goals", { :controller => "goals", :action => "index" })
  get("/goals/:path_id", { :controller => "goals", :action => "show" })
  get("/goals/new_goal", { :controller => "goals", :action => "new" })
  get("/delete_goal/:path_id", { :controller => "goals", :action => "destroy" })
  get("/insert_goal", { :controller => "goals", :action => "create" })
  get("/modify_goal/:path_id", { :controller => "goals", :action => "update" })

  get("/user_sign_up", { :controller => "users", :action => "new_registration_form" }) 
  get("/user_sign_out", { :controller => "users", :action => "remove_cookies" }) 
  get("/user_sign_in", { :controller => "users", :action => "new_session_form" }) 


  get("/users", { :controller => "users", :action => "index" })
  get("/users/:the_username", { :controller => "users", :action => "show" })
  get("/delete_user/:path_id", { :controller => "users", :action => "destroy" })
  get("/insert_user_record", { :controller => "users", :action => "create" })
  get("/modify_user/:path_id", { :controller => "users", :action => "update" })
end

Rails.application.routes.draw do

  get("/", { :controller => "goals", :action => "index" })

  get("/goals", { :controller => "goals", :action => "index" })
  get("/goals/:path_id", { :controller => "goals", :action => "show" })
  get("/delete_goal/:path_id", { :controller => "goals", :action => "destroy" })
  get("/insert_goal", { :controller => "goals", :action => "create" })
  get("/modify_goal/:path_id", { :controller => "goals", :action => "update" })

  get("/users", { :controller => "users", :action => "index" })
  get("/users/:path_id", { :controller => "users", :action => "show" })
  get("/delete_user/:path_id", { :controller => "users", :action => "destroy" })
  get("/insert_user", { :controller => "users", :action => "create" })
  get("/modify_user/:path_id", { :controller => "users", :action => "update" })
end

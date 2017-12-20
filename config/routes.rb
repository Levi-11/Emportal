Rails.application.routes.draw do
  get 'employee/dashboard'

  get 'employee/details'

  get 'admin/dashboard'

  get 'admin/employee'

  get 'admin/add_employee'
  post 'admin/add_employee', to: 'admin#create'

  get 'admin/employee_details'

  post 'admin/employee_details'

  get 'admin/project'
  get 'admin/edit_employee'
  patch 'admin/edit_employee', to: 'admin#update'
  delete '/admin/delete', to: 'admin#destroy'

  get 'login/admin'
  post '/login/admin', to: 'login#create'
  delete '/logout', to: 'login#destroy'

  get 'login/employee'
  post '/login/employee', to: 'login#empcreate'
  delete '/emplogout', to: 'login#empdestroy'

  root 'login#home'

  resources :admin

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

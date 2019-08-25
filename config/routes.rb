Rails.application.routes.draw do
  get "/dashboard" => "lets_encrypt#dashboard"
  post "/certi/status" => "lets_encrypt#check_status"
  post "/certi/generate" => "lets_encrypt#generate_certificate"
  post "/certi/adduser" => "lets_encrypt#add_user"
  post "/certi/renew" => "lets_encrypt#renew_certificate"
  post "/certi/delete" => "lets_encrypt#delete_certificate"
end

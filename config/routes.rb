Rails.application.routes.draw do
  post "/certi/generate" => "lets_encrypt#generate_certificate"
  post "/certi/renew" => "lets_encrypt#renew_certificate"
  post "/certi/delete" => "lets_encrypt#delete_certificate"
end

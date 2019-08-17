Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      get "db/status" => "le_users#db_status"
      post "db/new" => "le_users#db_create"
      
    end
  end
end

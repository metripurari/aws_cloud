Rails.application.routes.draw do

  namespace :service do
    resources :amazon_cloud_front, path: '/AmazonCloudFront/region', only: %i[show] do
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

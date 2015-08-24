Rails.application.routes.draw do
  root 'main#index'
  get 'settings' => 'main#settings', as: :settings
  put 'update_settings' => 'main#update_settings', as: :update_settings
end

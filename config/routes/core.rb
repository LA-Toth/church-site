ChurchSite::Application.routes.draw do
  get :healthcheck, to: 'healthcheck#index'
  get 'site-props', to: 'site_props#index'
end

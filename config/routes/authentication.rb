ChurchSite::Application.routes.draw do
  post 'login', to: 'session#authenticate'
  post 'authenticate', to: 'session#authenticate'
end

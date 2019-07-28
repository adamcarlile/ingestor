Rails.application.routes.draw do
  match '/', to: 'events#create', via: [:post, :put]
end

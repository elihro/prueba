Rails.application.routes.draw do
  resources :categories, :soups

  root to: "categories#index"

  get "/allcategories", to: redirect("/")

  get "/soup/:id/toggle_featured", to: "soups#toggle_featured", as: :toggle_featured

  get "/secret_soups", to: "soups#secret_soups"
end

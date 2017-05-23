Rails.application.routes.draw do

  get 'welcome/index'


  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :articles
  resources :people, only: [:index]
  resources :users


  get 'createshop', to: 'special#createshop'


  get 'camelcase', to: 'special#camelCase'
  get 'findinitby', to: 'special#findinitby'
  get 'renderdiffviewsamecont', to: 'special#renderdiffviewsamecont'


  get 'renderdiffviewdiffcont', to: 'special#renderdiffviewdiffcont'


  get 'jsonoutput', to: 'jsonize#jsonoutput'
  get 'jsonfromurl', to: 'jsonize#jsonfromurl'

  get 'jsonwithtoken', to: 'jsonize#jsonwithtoken'

  get 'userindex', to: 'jsonize#index'
  get 'jsonwithrestclient', to: 'jsonize#jsonwithrestclient'

  get 'getrandomrecord', to: 'special#getrandomrecord'


  get 'select', to: 'select#index'

  get 'selectjson', to: 'select#selectjson'

  get 'selectjsontest', to: 'select#selectjsontest'

  get 'showintercept', to: 'intercept#index'
  post 'methodtobeintercepted', to: 'intercept#methodtobeintercepted'
  post 'anothermethod', to: 'intercept#anothermethod'


end


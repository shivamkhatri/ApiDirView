Rails.application.routes.draw do

  root 'pathprint#printdir'
  get ':path' ,to: 'pathprint#printdir'

end

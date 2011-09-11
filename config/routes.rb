PairingMatrix::Application.routes.draw do
  root :to => "admin#home"
  match "matrix" => "admin#matrix"

end

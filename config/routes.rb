PairingMatrix::Application.routes.draw do
  root :to => "admin#home"
  match "matrix" => "admin#matrix"
  match "relation" => "admin#relation"
  match "result" => "admin#result"

end

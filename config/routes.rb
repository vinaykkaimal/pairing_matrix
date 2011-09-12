PairingMatrix::Application.routes.draw do
  root :to => "admin#home"
  match "matrix" => "admin#matrix"
  match "pair_finder" => "admin#pair_finder"
  match "no_of_pairings" => "admin#no_of_pairings"

end

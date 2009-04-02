class Session < Authlogic::Session::Base
  authenticate_with Account
end
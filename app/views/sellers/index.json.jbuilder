json.array!(@sellers) do |seller|
  json.extract! seller, :id, :personId, :document, :username, :userLastName, :email, :password, :password_confirmation, :telephone, :userType, :status
  json.url seller_url(seller, format: :json)
end

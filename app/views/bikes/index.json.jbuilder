json.array!(@bikes) do |bike|
  json.extract! bike, :id, :productId, :productReference, :productName, :productTradeMark, :productImage, :productPrice, :productStatus, :productDescription, :measures, :bikeType
  json.url bike_url(bike, format: :json)
end

json.array!(@products) do |product|
  json.extract! product, :id, :productId, :productReference, :productName, :productTradeMark, :productPrice, :productStatus, :productDescription, :typeProduct, :measures, :bikeType, :size, :gender
  json.url product_url(product, format: :json)
end

json.array!(@product) do |product|
  json.extract! product, :id, :productId, :productReference, :productName, :productTradeMark, :productImage, :productPrice, :productStatus, :productDescription, :size, :gender
  json.url product_url(product, format: :json)
end

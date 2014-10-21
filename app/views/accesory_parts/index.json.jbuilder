json.array!(@accesory_parts) do |accesory_part|
  json.extract! accesory_part, :id, :productId, :productReference, :productName, :productTradeMark, :productImage, :productPrice, :productStatus, :productDescription, :typeElement
  json.url accesory_part_url(accesory_part, format: :json)
end

json.array!(@inventories) do |inventory|
  json.extract! inventory, :id, :productAmount, :productId
  json.url inventory_url(inventory, format: :json)
end

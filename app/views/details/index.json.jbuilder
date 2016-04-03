json.array!(@details) do |detail|
  json.extract! detail, :id, :name, :hours_from, :hours_to, :price_from, :price_to
  json.url detail_url(detail, format: :json)
end

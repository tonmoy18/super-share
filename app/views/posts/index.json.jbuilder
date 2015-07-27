json.array!(@posts) do |post|
  json.extract! post, :post, :author, :cost
  json.url post_url(post, format: :json)
end
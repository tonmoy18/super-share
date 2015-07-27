json.array!(@logins) do |login|
  json.extract! login, :first_name, :last_name, :username, :password_hash, :login_type
  json.url login_url(login, format: :json)
end

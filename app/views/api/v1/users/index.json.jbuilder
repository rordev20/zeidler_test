json.status 200
json.message I18n.t('global.success')
json.data do
  json.users @users.each do |user|
    json.id user.id
    json.first_name user.first_name
    json.last_name  user.last_name
    json.email user.email
    json.age user.age
    json.gender user.gender
    json.country user.country.name
  end
end


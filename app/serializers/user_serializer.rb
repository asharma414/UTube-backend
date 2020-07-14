class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :dob, :country, :password, :username
end

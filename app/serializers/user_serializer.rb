class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :dob, :country, :username, :user_subscriptions, :subscriber_count

end

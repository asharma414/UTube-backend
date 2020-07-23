class SubscriptionSerializer < ActiveModel::Serializer
  attributes :id, :subscriber_id, :subscribee_id
end

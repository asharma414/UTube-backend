class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :dob, :country, :username, :subscribees, :subscriber_count

  def subscribees
    object.subscribees.as_json(only: [:username, :id])
  end

end

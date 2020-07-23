class Subscription < ApplicationRecord
    belongs_to :subscriber, class_name: 'User'
    belongs_to :subscribee, class_name: 'User'
end

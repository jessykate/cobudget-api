require 'playhouse/context'
require 'cobudget/entities/bucket'
require 'cobudget/entities/user'
require 'cobudget/entities/account'

module Cobudget
  module Allocations
    class ListByBucket < Playhouse::Context
      actor :bucket, repository: Bucket, role: EntryCollection

      def perform
        allocations = []
        bucket.budget.accounts.each_with_index do |a, i|
          next if i == 0
          allocation = {}
          allocation['user_id'] = a.user.id
          allocation['user_color'] = a.user.bg_color
          allocation['user_name_or_email'] = a.user.name ? a.user.name : a.user.email
          allocation['amount'] = bucket.balance_from_user(a.user, bucket.budget.id)
          allocations << allocation
        end
        allocations.as_json
        ##Ideal
        #bucket.allocations.as_json(include: :user)
      end
    end
  end
end
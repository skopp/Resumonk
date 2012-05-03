class PaymentNotification < ActiveRecord::Base
  belongs_to :user
  serialize :params
  after_create :mark_user_as_pro

  
  private
    def mark_user_as_pro
      if status == "Completed"
        user = User.find(self.user)
        user.pro = true
        user.save!
      end
    end
    
end

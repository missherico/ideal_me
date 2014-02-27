class EmailWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

   recurrence { daily}


  def perform()
     @users = User.all
     @users.each do |user|
       unless user.recently_active?
         ReminderMailer.remind(user).deliver 
       end
     end
  end

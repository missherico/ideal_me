class EmailWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

   recurrence { weekly}


  def perform()
     @users = User.all
     @users.each do |user|
       if user.recently_active?
        CongratMailer.congrat(user).deliver
       else 
         ReminderMailer.remind(user).deliver 
       end
     end
  end
end
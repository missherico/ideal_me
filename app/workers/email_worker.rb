class EmailWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { daily }

   def perform(userPId)
     @users = User.all
     @users.each do |user|
      @user.activities do |user_activity|
        time_since_last_activity = Time.now - user_activity.created_at
        #A day has 86,400 seconds, 5 days has 432,000 seconds
        if (time_since_last_activity > 432,000)
          ReminderMailer.remind(user).deliver
        end
     end
   end

 end

    
          
   end
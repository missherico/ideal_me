class EmailWorker
  include Sidekiq::EmailWorker

   def perform(current_user.id)
   end
 end
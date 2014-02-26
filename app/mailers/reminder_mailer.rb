class ReminderMailer < MandrillMailer::TemplateMailer
   default from: 'miss.herico@gmail.com'
  # def signup
  #    mandrill_mail template: "Welcome",template_name: "Welcome",
  #    subject: I18n.t('Welcome'),
  #    to: [{email: "syviecottrell@gmail.com"}]
  # end
  def remind(user)
  mandrill_mail template: 'Reminder',
                subject: 'How are you progressing',
                to: { email: user.email},
                vars: {
                  "FIRST_NAME" => user.first_name || "NO FIRST NAME",
                  "LAST_NAME"  => user.last_name || "NO LAST NAME",
                  "LAST_ACTIVITY" => user.activities.last.body || 'NO ACTIVITY'
                  "LAST_ACTIVITY_TIME" => "on" + user.activities.last.created_at || ''
.
                }              
  end
  

end 
class ReminderMailer < MandrillMailer::TemplateMailer
   default from: 'miss.herico@gmail.com'

  def remind(user)
  mandrill_mail template: 'Reminder',
                subject: 'How are you progressing',
                to: { email: user.email},
                vars: {
                  "FIRST_NAME" => user.first_name || "NO FIRST NAME",
                  "LAST_NAME"  => user.last_name || "NO LAST NAME",
                 }              
  end
  

end 
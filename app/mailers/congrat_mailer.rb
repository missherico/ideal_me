class CongratMailer < MandrillMailer::TemplateMailer
   default from: 'miss.herico@gmail.com'

  def congrat(user)
  mandrill_mail template: 'Congrat',
                subject: 'Keep up the good work!',
                to: { email: user.email},
                vars: {
                  "FIRST_NAME" => user.first_name || "",
                  "LAST_NAME"  => user.last_name || "",
                  "DAY_LAST_ACTIVITY_ENTRY" => user.weekday_of_last_activity_date
                 }              
  end
  

end 
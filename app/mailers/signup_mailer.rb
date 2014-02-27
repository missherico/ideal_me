class SignupMailer < MandrillMailer::TemplateMailer
   default from: 'miss.herico@gmail.com'
  # def signup
  #    mandrill_mail template: "Welcome",template_name: "Welcome",
  #    subject: I18n.t('Welcome'),
  #    to: [{email: "syviecottrell@gmail.com"}]
  # end
  def signup(user)
  mandrill_mail template: 'Welcome',
                subject: 'Welcome',
                to: { email: user.email},
                vars: {
                  "FIRST_NAME" => user.first_name || "",
                  "LAST_NAME"  => user.last_name || ""
                }              
  end
  

end 
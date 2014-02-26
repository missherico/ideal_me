class SignupMailer < MandrillMailer::TemplateMailer
   default from: 'miss.herico@gmail.com'
  # def signup
  #    mandrill_mail template: "Welcome",template_name: "Welcome",
  #    subject: I18n.t('Welcome'),
  #    to: [{email: "syviecottrell@gmail.com"}]
  # end
  def signup()
  mandrill_mail template: 'Welcome',
                subject: I18n.t('Welcome'),
                to: { email: 'sylviecottrell@gmail.com'}
               
                
  end
  

end 
class ApplicationMailer < ActionMailer::Base
  default from: "ACRYR@ruby.com"
  layout 'mailer'

  def send_mail( user_mail, mail_to, subject, content)
  	mail(from: user_mail ,to: mail_to ,subject: subject ,body: content)
  end

  def send_mail_claim(claim)
    if claim.is_a?(Claim)
      subject= claim.title << " [ACRYR]"
      content= claim.title << "\n " << claim.content << "\n" << claim_path(claim) << "\n See you soon"
      send_mail( from: "yoann.lm@laposte.net", to: "romain.jean30@gmail.com", subject: subject, body: content)
      claim.mailSend = true
      claim.save
    end
  end

  def send_mails_for_expired_claims
    for Claim.all.each do |claim|
      if !claim.mailSend && claim.created_at < Date.now-30.days
        send_mail_claim(claim)
      end
    end
  end

end

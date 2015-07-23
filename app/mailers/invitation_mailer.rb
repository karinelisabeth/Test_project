class InvitationMailer < ApplicationMailer

    def invitation_email(membership)
      @email = membership.email
      @code = membership.invitation_code
      @organisation_name = membership.organisation.name
      @url  = accept_invitation_url(membership.invitation_code)
      mail(to: @email, subject: "Your are invited to join #{@organisation_name}")
    end

end

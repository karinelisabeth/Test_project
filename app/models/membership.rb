class Membership < ActiveRecord::Base
  # http://stackoverflow.com/questions/16771503/how-to-join-mutli-role-multi-organisation-tables-in-rails
  belongs_to :user
  belongs_to :organisation

  before_create do
    self.invitation_code = SecureRandom.base64(12)
  end

  def invitation_expired_at
    created_at + 10.days
  end

  def invitation_expired?
    invitation_expired_at < Time.now
  end

  def activate!
    if !activated?
      self.activated_at = Time.now
      save
    else
      raise "You have already activated your membership"
    end
  end

  def activated?
    !!activated_at
  end

end

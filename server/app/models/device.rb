class Device < ApplicationRecord
  belongs_to :user

  validates :device_type, inclusion: { in: %w[ios android] }
  validates :token, presence: true, uniqueness: true

  def self.send_notification(tokens, payload, device_type = 'android')
    notifier = (device_type == 'android' ? Notifier::Gcm.new : Notifier::Ios.new)
    begin
      notifier.deliver("#{device_type}_app", tokens, payload)
    rescue StandardError => e
      Rails.logger.debug e
    end
  end
end

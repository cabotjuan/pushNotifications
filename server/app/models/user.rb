class User < ApplicationRecord
  has_many :devices

  validates :email, uniqueness: true

  def send_android_notification(title, description)
    send_notification(title, description, 'android')
  end

  def send_ios_notification(title, description)
    send_notification(title, description, 'ios')
  end

  private

  def send_notification(title, description, device_type)
    payload = { payload: { title: title, description: description } }
    tokens = Device.where(device_type: device_type, user_id: id.to_i).pluck(:token).compact
    Device.send_notification(tokens, payload, device_type)
  end
end

module Notifier
  class Gcm
    def deliver(app, tokens, payload, expiry = 1.day.to_i)
      tokens = *tokens
      n = Rpush::Gcm::Notification.new
      n.app = Rpush::Gcm::App.find_by_name(app)
      n.registration_ids = tokens
      n.expiry = expiry
      n.notification = { title: payload[:payload][:title], body: payload[:payload][:description] }
      n.priority = 'high'
      n.save!
    end
  end

  # class Ios
  #   def deliver(app, tokens, payload)
  #     tokens = *tokens
  #     n = Rpush::Gcm::Notification.new
  #     n.app = Rpush::Gcm::App.find_by_name(app)
  #     n.registration_ids = tokens
  #     n.data = payload
  #     n.notification = { title: payload[:payload][:title] }
  #     n.save!
  #   end
  # end
end

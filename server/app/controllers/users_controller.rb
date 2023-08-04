class UsersController < ApplicationController
  def notify_all
    if User.exists?
      User.all.each do |user|
        user.send_android_notification('Notificacion de backend', 'Descripcion de notificacion')
      end
      render json: { status: 'Notifications sent!' }, status: :ok
    else
      render json: { status: 'There are no Users to notify.' }, status: :bad_request
    end
  end
end

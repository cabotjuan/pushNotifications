class DevicesController < ApplicationController
  def create
    if Device.find_by(token: create_params['token'])
      return render json: { status: 'El dispositivo ya esta registrado.' }, status: :ok
    end

    device = Device.new(create_params)
    if device.save
      render json: { device: device }, status: :created
    else
      render json: { errors: device.errors }, status: :unprocessable_entity
    end
  end

  private

  def create_params
    params.require(:device).permit(:user_id, :token, :device_type)
  end
end

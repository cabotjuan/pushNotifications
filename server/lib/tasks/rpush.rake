namespace :rpush do
  desc 'Create Rpush android app'
  task android_app: [:environment] do
    Rpush::Gcm::App.create(name: 'android_app', connections: 1, environment: 'development',
                           type: 'Rpush::Client::ActiveRecord::Gcm::App',
                           auth_key: 'AAAAMqZfdIk:APA91bEDd4SjOGMXNuqMfL7-f8KPydzv-_w8QHlb_9jA1XBJaKOzKjlcNuDfnH4EiJKBaSanAvEZGWPOeSlu1xCWrprdMxt97hxQ7LuK4RxwUgo_TbSouiZ_HijPItc4fVUiJAnzxQLa')
    puts 'Rpush Android app created Successfully'
  end

  # desc "Create Rpush Ios app"
  # task ios_app: [:environment] do
  #   Rpush::Gcm::App.create(name: "ios_app", connections: 1, environment: 'development', type: "Rpush::Client::ActiveRecord::Gcm::App", auth_key: AUTH_KEY, certificate: File.read("config/file_name.p8"))
  #   puts "Rpush IOS app created Successfully"
  # end
end

if Rails.env.production?

	Carrier.wave.confugre do |config|
		config.fog_credentials = {
			:provider => 'AMS',
			:aws_access_key_id => ENV['S3_ACCESS_KEY'],
			:aws_seccret_access_key => ENV['S3_SECRET_KEY']
		}
		config.fog.directory = ENV['S3_BUCKET']
	end
end
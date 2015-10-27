if Rails.env.production?

	CarrierWave.configure do |config|
		#config.fog_provider = 'fog/aws'
		config.fog_credentials = {
			:provider => 'AWS',
			aws_access_key_id:     'AKIAJTS5XJT2WLX4HX2Q',                        # required
    		aws_secret_access_key: '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',  
			#:aws_access_key_id => ENV['S3_ACCESS_KEY'],
			#:aws_secret_access_key => ENV['S3_SECRET_KEY']
		}
		#config.fog_directory = ENV['S3_BUCKET'] railsrecipeimageheroku
		config.fog_directory = 'railsrecipeimageheroku'

	end
end
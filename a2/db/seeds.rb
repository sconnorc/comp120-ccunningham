App.delete_all

File.open ('db/app_data.txt') do |apps|
	apps.read.each_line do |app|
		app_title, description = app.chomp.split('|')
		App.create!(:app_title => app_title, :description => description, :active => 'true')
	end
end
require 'rubygems'
require 'sinatra'

get '/hi' do
	'dsfsdf'
end

get '/approved' do
	File.open('/tmp/approved-id.log', 'a') do |f|
		f.write(params['id'] + "\n")
	end
end

get '/find' do
	id = params['id']
	
	registered_ids = []
	
	File.open('/tmp/approved-id.log', 'r').each_line do |l|
		registered_ids << l.sub("\n", "")
	end
	
	ret = "false"
	
	registered_ids.each do |rid|
		if rid == id
			ret = "true"
		end
	end
	
	ret
end

get '/denied' do
	id = params['id']
	
	registered_ids = []
	
	File.open('/tmp/approved-id.log', 'r').each_line do |l|
		registered_ids << l.sub("\n", "")
	end
	
	ret = "false"
	
	registered_ids.each do |rid|
		if rid == id
			registered_ids.delete(rid)
		end
	end
	
	File.open('/tmp/approved-id.log', 'w') do |f|
		f.write(registered_ids.join("\n"))
		f.write("\n")
	end
end

get '/test' do
	'hi toby'
	
	erb :test
end
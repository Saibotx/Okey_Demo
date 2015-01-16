require 'rubygems'
require 'sinatra'

get '/hi' do
	'dsfsdf'
end


get '/Lock' do
	id = params['id']
	approve = params['approve']
	deny = params['deny']
	find = params['find']
	viewlog = params['viewlog']
	
	if id.nil?
		puts "MUST SPECIFY ID"
	elsif 1
		case
		when approve = 1
			#approve code here
			Success approve
		when deny = 1
			#deny code here
			Success deny
		when find = 1
			#find code here
			Success find
		when viewlog = 1
			#viewlog code here
			Success viewlog
		else
			puts "NO COMMAND SPECIFIED"
		end
	end
	
end


get '/approved' do
	if File.exist?('./tmp/approved-id.log')
		File.open('./tmp/approved-id.log', 'a') do |f|
			f.write(params['id'] + "\n")
		end
	else
		myfile = File.new('./tmp/approved-id.log', "w+")
		myfile.puts(params['id'] + "\n")
		myfile.close
	end
	
	"success"
end

get '/find' do
	id = params['id']
	
	registered_ids = []
	
	File.open('./tmp/approved-id.log', 'r').each_line do |l|
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
	
	File.open('./tmp/approved-id.log', 'r').each_line do |l|
		registered_ids << l.sub("\n", "")
	end
	
	ret = "false"
	
	registered_ids.each do |rid|
		if rid == id
			registered_ids.delete(rid)
		end
	end
	
	File.delete('./tmp/approved-id.log')
	
	myfile = File.new('./tmp/approved-id.log', "w+")
	myfile.puts(registered_ids.join("\n"))
	myfile.puts("\n")
	myfile.close
	
	"success"
end

get '/test' do
	'hi toby'
	
	erb :test
end
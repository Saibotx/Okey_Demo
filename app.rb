require 'rubygems'
require 'sinatra'

get '/hi' do
	'dsfsdf'
end


get '/Lock' do
	device = "lock"
	id = params['id']
	approve = params['approve']
	deny = params['deny']
	find = params['find']
	viewlog = params['viewlog']
	delete = params['delete']
	
	if id.nil?
		"MUST SPECIFY ID"
	else
		"WE HAVE ID"
	end
	if approve.nil?
		if deny.nil?
			if find.nil?
				if viewlog.nil?
					if delete.nil?
						"ERROR: Put a command"
					else
						#doing delete
						if File.exist?("./tmp/#{device}-approved-id.log")
							File.delete("./tmp/#{device}-approved-id.log")
							"File deleted"
						else
							"FILE DOES NOT EXIST - DELeTE"
						end
					end
				else
					#viewlog stuff goes here
					"doing viewlog"
				end
			else
				#doing find
				registered_ids = []
				if File.exist?("./tmp/#{device}-approved-id.log")
					File.open("./tmp/#{device}-approved-id.log", 'r').each_line do |l|
						registered_ids << l.sub("\n", "")
					end
					File.close("./tmp/#{device}-approved-id.log")
					ret = "false find"
					registered_ids.each do |rid|
						if rid == id
							ret = "true find"
						end
					end
					ret
				else
					ret = "device file not found - Find"
					ret
				end
			end				
		else
			#doing deny
			registered_ids = []
			if File.exist?("./tmp/#{device}-approved-id.log")
				File.open("./tmp/#{device}-approved-id.log", 'r').each_line do |l|
					registered_ids << l.sub("\n", "")
				end
				ret = "false"
				registered_ids.each do |rid|
					if rid == id
						registered_ids.delete(rid)
					end
				end
					File.delete("./tmp/#{device}-approved-id.log")
					myfile = File.new("./tmp/#{device}-approved-id.log", "w+")
				myfile.puts(registered_ids.join("\n"))
				myfile.puts("\n")
				myfile.close
				"doing DENY"
			
			else
			"device file not found - DENY"
			end
		end	
	else
		#do approved
		if File.exist?("./tmp/#{device}-approved-id.log")
			File.open("./tmp/#{device}-approved-id.log") do |f|
				f.write(params['id'] + "\n")
			end
		else
			myfile = File.new("./tmp/#{device}-approved-id.log", "w+")
			myfile.puts(params['id'] + "\n")
			myfile.close
		end
		"DOING APPROVE"
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
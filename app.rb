require 'rubygems'
require 'sinatra'

get '/hi' do
	'dsfsdf'
end


get '/lock' do
	device = "lock"
	id = params['id']
	approve = params['approve']
	deny = params['deny']
	find = params['find']
	viewlog = params['viewlog']
	delete = params['delete']
	
	if id.nil?
		"MUST SPECIFY IdD"
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
				ret = "Cant find userid to delete"
				registered_ids.each do |rid|
					if rid == id
						registered_ids.delete(rid)
						ret = "found userid and deleted"
					end
				end
				File.delete("./tmp/#{device}-approved-id.log")
				myfile = File.new("./tmp/#{device}-approved-id.log", "w+")
				myfile.puts(registered_ids.join("\n"))
				myfile.puts("\n")
				myfile.close
				ret
			
			else
			"device file not found - DENY"
			end
		end	
	else
		#do approved
#		registered_ids = []
#		if File.exist?("./tmp/#{device}-approved-id.log")
#			File.open("./tmp/#{device}-approved-id.log", 'r').each_line do |l|
#				registered_ids << l.sub("\n", "")
#			end
#			registered_ids.each do |rid|
#				if rid = id
#					registered_ids << id.sub("\n", "")
#					ret = "id is already on the list!"
#				else
#					registered_ids << id.sub("\n", "")
#					ret = "approved done"
#				end
#			end
#			File.delete("./tmp/#{device}-approved-id.log")
#			myfile = File.new("./tmp/#{device}-approved-id.log", "w+")
#			myfile.puts(registered_ids.join("\n"))
#			myfile.puts("\n")
#			myfile.close
		if File.exist?("./tmp/#{device}-approved-id.log")
			File.open("./tmp/#{device}-approved-id.log", 'a') do |f|
				f.write(params['id'] + "\n")
			end			
			
			
#			File.open("./tmp/#{device}-approved-id.log", 'w') do |f|
#				f.write(params['id'] + "\n")
#			end
		else
			myfile = File.new("./tmp/#{device}-approved-id.log", "w+")
			myfile.puts(params['id'] + "\n")
			myfile.close
			ret = "newfile created and id added"
		end
		ret
	end
		
end

get '/CompUSB' do
	device = "CompUSB"
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
				ret = "Cant find userid to delete"
				registered_ids.each do |rid|
					if rid == id
						registered_ids.delete(rid)
						ret = "found userid and deleted"
					end
				end
				File.delete("./tmp/#{device}-approved-id.log")
				myfile = File.new("./tmp/#{device}-approved-id.log", "w+")
				myfile.puts(registered_ids.join("\n"))
				myfile.puts("\n")
				myfile.close
				ret
			
			else
			"device file not found - DENY"
			end
		end	
	else
		#do approved
#		registered_ids = []
#		if File.exist?("./tmp/#{device}-approved-id.log")
#			File.open("./tmp/#{device}-approved-id.log", 'r').each_line do |l|
#				registered_ids << l.sub("\n", "")
#			end
#			registered_ids.each do |rid|
#				if rid = id
#					registered_ids << id.sub("\n", "")
#					ret = "id is already on the list!"
#				else
#					registered_ids << id.sub("\n", "")
#					ret = "approved done"
#				end
#			end
#			File.delete("./tmp/#{device}-approved-id.log")
#			myfile = File.new("./tmp/#{device}-approved-id.log", "w+")
#			myfile.puts(registered_ids.join("\n"))
#			myfile.puts("\n")
#			myfile.close
		if File.exist?("./tmp/#{device}-approved-id.log")
			File.open("./tmp/#{device}-approved-id.log", 'a') do |f|
				f.write(params['id'] + "\n")
			end			
			
			
#			File.open("./tmp/#{device}-approved-id.log", 'w') do |f|
#				f.write(params['id'] + "\n")
#			end
		else
			myfile = File.new("./tmp/#{device}-approved-id.log", "w+")
			myfile.puts(params['id'] + "\n")
			myfile.close
			ret = "newfile created and id added"
		end
		ret
	end
		
end

get '/bulb' do
	device = "bulb"
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
				ret = "Cant find userid to delete"
				registered_ids.each do |rid|
					if rid == id
						registered_ids.delete(rid)
						ret = "found userid and deleted"
					end
				end
				File.delete("./tmp/#{device}-approved-id.log")
				myfile = File.new("./tmp/#{device}-approved-id.log", "w+")
				myfile.puts(registered_ids.join("\n"))
				myfile.puts("\n")
				myfile.close
				ret
			
			else
			"device file not found - DENY"
			end
		end	
	else
		#do approved
#		registered_ids = []
#		if File.exist?("./tmp/#{device}-approved-id.log")
#			File.open("./tmp/#{device}-approved-id.log", 'r').each_line do |l|
#				registered_ids << l.sub("\n", "")
#			end
#			registered_ids.each do |rid|
#				if rid = id
#					registered_ids << id.sub("\n", "")
#					ret = "id is already on the list!"
#				else
#					registered_ids << id.sub("\n", "")
#					ret = "approved done"
#				end
#			end
#			File.delete("./tmp/#{device}-approved-id.log")
#			myfile = File.new("./tmp/#{device}-approved-id.log", "w+")
#			myfile.puts(registered_ids.join("\n"))
#			myfile.puts("\n")
#			myfile.close
		if File.exist?("./tmp/#{device}-approved-id.log")
			File.open("./tmp/#{device}-approved-id.log", 'a') do |f|
				f.write(params['id'] + "\n")
			end			
			
			
#			File.open("./tmp/#{device}-approved-id.log", 'w') do |f|
#				f.write(params['id'] + "\n")
#			end
		else
			myfile = File.new("./tmp/#{device}-approved-id.log", "w+")
			myfile.puts(params['id'] + "\n")
			myfile.close
			ret = "newfile created and id added"
		end
		ret
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
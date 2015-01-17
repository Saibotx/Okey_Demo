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
	viewp = params['viewp']
	logadd = params['logadd']
	logclear = params['logclear']
	action = params['action']
	
	
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
						if viewp.nil?
							if logadd.nil?
								if logclear.nil?
									"ERROR: Put a command"
								else
									#DOING LOG CLEAR
									if File.exist?("./tmp/#{device}-log.log")
										File.delete("./tmp/#{device}-log.log")
										"Logs deleted"
									else
										"FILE DNE - logclear"
									end
								end
							else
								#DOING LOG ADD
								#must have date-time-id-action
								time1 = Time.new
								if File.exist?("./tmp/#{device}-log.log")
									File.open("./tmp/#{device}-log.log", 'a') do |f|
										f.write("#{time1.inspect} - #{id} - #{action}" + "\n")
									end
									ret = "Added #{time1.inspect} - #{id} - #{action}" + "\n"
								else
									myfile = File.new("./tmp/#{device}log.log", "w+")
									myfile.puts("#{time1.inspect} - #{id} - #{action}" + "\n")
									myfile.close
									ret = "newfile for #{device} created and added #{time1.inspect} - #{id} - #{action}" + "\n"
								end
								ret
							end
						else
							#doing view permission file
							registered_ids = []
							if File.exist?("./tmp/#{device}-approved-id.log")
								File.open("./tmp/#{device}-approved-id.log", 'r').each_line do |l|
									registered_ids << l
								end
							else
								registered_ids = "File not found - view permissions"
							end
							registered_ids

						end
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
					#DOING view log
					log_lines = []
					if File.exist?("./tmp/#{device}-log.log")
						File.open("./tmp/#{device}-log.log", 'r').each_line do |l|
							log_lines << l
						end
					else
						log_lines = "ERROR: File not found - logview"
					end
					log_lines
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
		#doign approve
		if File.exist?("./tmp/#{device}-approved-id.log")
			File.open("./tmp/#{device}-approved-id.log", 'a') do |f|
				f.write(params['id'] + "\n")
			end
			ret = "added! #{id}"
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
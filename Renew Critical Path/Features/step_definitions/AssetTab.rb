#All Success Plan - Asset Tab,Service Contract Tab specific Step definitions
#All Scenario mentioned in AssetTab.feature, ServiceContractTab.feature

Then (/^I select the created SuccessPlan$/) do
	begin
		sleep 5
		arg = getReference "Reference"
		accName = arg["Account"]
		spName = arg["Account"]+" Success Plan"
		select "All", :from => "fcf"
		sleep 3
		within(".fBody") do
			click_on "Go!"
		end
		sleep 5
		foundCount = ""
		begin  
			within(".x-grid3-body") do
				tr = all(".x-grid3-row")
				tr.each do |row|
				  if row.all("td")[3].text==spName
					row.all("td")[2].all('a')[0].click
					puts "Successfully navigated to selected SuccessPlan"
					foundCount = "found"
					break
				  end	
				end
			end
			if page.has_css?('.next')
				find(".next").click
				sleep 3
			else
				break
			end
		end until (page.has_css?('.nextoff'))
		if foundCount==""
			within(".x-grid3-body") do
				tr = all(".x-grid3-row")
				tr.each do |row|
				 if row.all("td")[3].text==spName
					row.all("td")[2].all('a')[0].click
					puts "Successfully navigated to selected SuccessPlan"
					foundCount = "found"
					break
				  end	
				end
			end
		end
		sleep 5
	rescue Exception => ex
		putstr "Error occurred while opening a SuccessPlan"
		putstr_withScreen  ex.message
	end
end

Then(/^I click on "([^"]*)" subtab$/) do |arg1|
	within("#ss-tabs") do
		click_on arg1
	end
    sleep 3
    puts "Navigated to " + arg1 + " subtab"
end

And (/^I verify the count of all "(.*?)"$/) do |arg|
	begin
		arg1 = getReference "Reference"
		accName = arg1["Account"]
		arg2 = getDetails arg+"Param"
		relatedlist = arg2["list"]
		section = arg2["sectionNum"]
		
		if all(".pagination-info").count > 0 
			puts find(".pagination-info").text
			@recordCount = find(".pagination-info").text.split(/[^\d]/).last.to_i
			puts "No.of records on #{arg} grid: #{@recordCount}"
		else	
			puts 0
			@recordCount = 0
		end
		sleep 3
		
		click_on "Accounts"
		sleep 3
		select "My Accounts", :from => "fcf"
		sleep 3
		within(".fBody") do
			click_on "Go!"
		end
		sleep 5
		foundCount = ""
		begin  
			within(".x-grid3-body") do
				tr = all(".x-grid3-row")
				tr.each do |row|
					if row.all("td")[2].text == accName
						row.all("td")[2].all('a')[0].click
						puts "Navigated to Account page"
						foundCount = "found"
						break
					 end	
				end
			end
			if page.has_css?('.next')
				find(".next").click
				sleep 3
			else
				break
			end
		end until (page.has_css?('.nextoff'))
		if foundCount==""
			within(".x-grid3-body") do
				tr = all(".x-grid3-row")
				tr.each do |row|
					if row.all("td")[2].text == accName
						row.all("td")[2].all('a')[0].click
						puts "Navigated to Account page"
						foundCount = "found"
						break
					end	
				end
			end
		end
		sleep 3
		showMore = 0
		within all(".bRelatedList")[section] do
			if all(relatedlist).count >0
				within(relatedlist) do
					within('.pbBody') do
					    if all(".pShowMore").count > 0
							within('.pShowMore') do	
								showMore = 1
								all('a')[1].click
								puts "Clicked on Show more link of #{arg} related list"
								sleep 3
							end	
						else
							if all(".dataRow").count > 0
								@dataCount = all(".dataRow").count
								puts  "Assets on Account : #{@dataCount}"
								break
							end  
						end							
					end
				end
			else
				puts "#{arg} related list is not present on Account pagelayout"
			end
			
		end
		if showMore>0
			puts "Navigated to Asset list after clicking on Show more link"
			checkCount = ""
			sleep 2	
			#puts find(:css, ".fewerMore").text
			if find(:css, ".fewerMore").text == "Show me more records per list page"
				if find(:css, ".fewerMore").first("a").text == "more"
					# find(:css, ".fewerMore").first("a").click
					#puts "Clicked on fewer"
					find(:css, ".fewerMore").find("a",:text => "more").click
				end	
			end
			if find(:css, ".fewerMore").text =="Show me fewer / more records per list page"
				#puts find(:css, ".fewerMore").all("a")[1].text
				begin
					if find(:css, ".fewerMore").all("a")[1].text == "more"
						find(:css, ".fewerMore").find("a",:text => "more").click
						#puts "Clicked more"
						#puts find(:css, ".fewerMore").first("a").text
					end
				end until find(:css, ".fewerMore").text == "Show me fewer records per list page"
				# find(:css, ".fewerMore").first("a").click
				sleep 5
			end
			begin
				within('.listRelatedObject') do
					within('.pbBody') do
						within('.list') do	
							@dataCount = all(".dataRow").count
							puts @dataCount
							checkCount = "found"
						end	
					end
				end
				sleep 3
			end
		end
		sleep 3
		puts "Total no.of #{arg} records on Account #{arg} related list: #{@dataCount}"
		if @dataCount.to_i >= @recordCount.to_i
			puts "Successfully verified #{arg} record count"
		else
			putstr "#{arg} record count is not same on Account & it's Success Plan"
		end
	rescue Exception =>ex
		putstr "Error while verifying the record count of all #{arg} in #{arg} section from Success Plan"
		putstr_withScreen  ex.message
	end
end

Then(/^I verify the Status of "(.*?)"$/) do |arg|
	begin
		arg2 = getReference arg+"Ref"
		name = arg2["Name"]
		status = arg2["Status"]
		within(".bootstrap-table") do
			find(".form-control").set(name)
			sleep 3
			find(".dropdown-toggle").click
			sleep 2
			within(".dropdown-menu") do
				#puts all('input[type=checkbox]').count
				all('input[type=checkbox]').each do |checkbox|
					if checkbox.checked? then 
						checkbox.set(true)
					end
				end
				#puts all('input[type=checkbox]:checked').count
			end
		end
		within(".fixed-table-body") do
			tr = first("tbody").all("tr")
			tr.each do |row|
				if row.all("td")[1].text == name
					@status = row.all("td")[6].text
					puts "#{name} Status : #{@status}"
					break
				end  
			end
		end
		if @status == status
			puts "#{name} status is displayed"
		else
			raise "#{name} status is not displayed"
		end
	rescue Exception =>ex
		putstr "Error while verifying the Status of #{arg} in #{arg} section from Success Plan"
		putstr_withScreen  ex.message
	end
end

Then(/^I verify the Close Date of "(.*?)"$/) do |arg|
	begin
		arg2 = getReference arg+"Ref"
		name = arg2["Name"]
		closedate = arg2["ClosedDate"]
		within(".bootstrap-table") do
			find(".form-control").set(name)
			sleep 3
			find(".dropdown-toggle").click
			sleep 2
			within(".dropdown-menu") do
				all('input[type=checkbox]').each do |checkbox|
					if checkbox.checked? then 
						checkbox.set(true)
					end
				end
			end
		end
		within(".fixed-table-body") do
			tr = first("tbody").all("tr")
			tr.each do |row|
				if row.all("td")[1].text == name
					@closeDate = row.all("td")[11].text
					puts "#{name} - Close Date : #{@closeDate}"
					break
				end  
			end
		end
		if @closeDate == closedate
			puts "#{name} close date is displayed on the grid"
		else
			raise "#{name} close date is not displayed on the grid"
		end
	rescue Exception =>ex
		putstr "Error while verifying the Close Date of #{arg} in #{arg} section from Success Plan"
		putstr_withScreen  ex.message
	end
end

Then(/^I verify the show or hide columns of "(.*?)" grid$/) do |arg|
	begin
	sleep 3
		within(".bootstrap-table") do
			all(".dropdown-toggle")[0].click
			sleep 2
			within all(".dropdown-menu")[0] do
				all('input[type=checkbox]').each do |checkbox|
					if checkbox.checked? then 
						checkbox.set(true)
					end
				end
				@showCols = all('input[type=checkbox]:checked').count
				puts "All the fields are selected for display"
			end
		end
		headermap = Array.new
		within(".fixed-table-body") do
			headermap = first("thead").all("th").collect{ |column| column.text}
			puts "Columns on #{arg} grid: #{headermap}"
		end
		
		if @showCols == headermap.length
			puts "All #{arg} fields are displayed after clicking on Show columns"
		else
			raise "All #{arg} fields are not displayed after clicking on Show columns"
		end
		within(".bootstrap-table") do
			all(".dropdown-toggle")[0].click
			sleep 2
		end
		
		within(".bootstrap-table") do
			all(".dropdown-toggle")[0].click
			sleep 2
			within all(".dropdown-menu")[0] do
				all('input[type=checkbox]').each do |checkbox|
					0.upto(9) do
						if checkbox.checked? then 
							checkbox.set(false)
						end
					end
				end
				@Cols = all('input[type=checkbox]:checked').count
			end
		end

		colmap = Array.new
		within(".fixed-table-body") do
			colmap = first("thead").all("th").collect{ |column| column.text}
		end
		
		if @Cols == colmap.length
			puts "Specific #{arg} fields are displayed after clicking on Hide columns"
			puts "Columns on #{arg} grid: #{colmap}"
		else
			raise "Specific #{arg} fields are not displayed after clicking on Hide columns"
		end
		
	rescue Exception =>ex
		putstr "Error while verifying Show/Hide columns of #{arg} grid in #{arg} section from Success Plan"
		putstr_withScreen  ex.message
	end
end

Then(/^I verify grid columns on "(.*?)" subtab$/) do |arg|
	begin
		arg1 = getDetails arg+"cols"
		gridCols = Array.new
		headermap = Array.new
		gridCols = arg1["Columns"].split(",")
		puts "Asset fields to be verified : #{gridCols} "
		
		within(".bootstrap-table") do
			all(".dropdown-toggle")[0].click
			sleep 2
			within all(".dropdown-menu")[0] do
				all('input[type=checkbox]').each do |checkbox|
					if checkbox.checked? then 
						checkbox.set(true)
					end
				end
			end
		end
		
		within(".fixed-table-body") do
			headermap = first("thead").all("th").collect{ |column| column.text}
			puts "Columns on #{arg} grid: #{headermap}"
		end
		
		within(".bootstrap-table") do
			all(".dropdown-toggle")[0].click
			sleep 2
		end
		
		if headermap == gridCols
			puts "All #{arg} fields are displayed as grid columns"
		else
			raise "All #{arg} fields are not displayed as grid columns"
		end
	rescue Exception =>ex
		putstr "Error while verifying columns of #{arg} grid in #{arg} section from Success Plan"
		putstr_withScreen  ex.message
	end
end

Then(/^I verify pagination$/) do
	begin
		prevpageinfo = find(".pagination-info").text
		puts prevpageinfo
		if page.has_css?(".pagination")
		    currpage = find(".page-number.active").text.to_i
			lastPage = all(".page-number").last.text.to_i
			puts "No.of pages: #{lastPage}"
			while (lastPage > currpage) 
				puts "Current Page: #{currpage}"
				first(".page-next").first("a").click
				sleep 3
				currpage = find(".page-number.active").text.to_i
				currpageinfo = find(".pagination-info").text
				if prevpageinfo != currpageinfo
					puts "Successfully navigated to next page"
				end
			end
			puts "Current Page: #{currpage}"
		else
			puts "No.of Records are less than the selected page-list to verify pagination"
		end
		
	rescue Exception =>ex
		putstr "Error while verifying Pagination on grid"
		putstr_withScreen  ex.message
	end
end

Then(/^I verify the Stage of "(.*?)"$/) do |arg|
	begin
		arg2 = getReference arg+"Ref"
		name = arg2["Name"]
		stage = arg2["Stage"]
		within(".bootstrap-table") do
			find(".form-control").set(name)
			sleep 3
			find(".dropdown-toggle").click
			sleep 2
			within(".dropdown-menu") do
				all('input[type=checkbox]').each do |checkbox|
					if checkbox.checked? then 
						checkbox.set(true)
					end
				end
			end
		end
		within(".fixed-table-body") do
			tr = first("tbody").all("tr")
			tr.each do |row|
				if row.all("td")[1].text == name
					@salesStage = row.all("td")[10].text
					puts "#{name} - Sales Stage : #{@salesStage}"
					break
				end  
			end
		end
		if @salesStage == stage
			puts "#{name} Sales Stage is displayed on the grid"
		else
			raise "#{name} Sales Stage is not displayed on the grid"
		end
	rescue Exception =>ex
		putstr "Error while verifying the Stage of #{arg} in #{arg} section from Success Plan"
		putstr_withScreen  ex.message
	end

end

Then(/^I get data of "(.*?)"$/) do |arg|
	begin
		arg1 = getReference arg+"Ref"
		name = arg1["Name"]
		
		colmap = Array.new
		headermap = Array.new
		datamap = Hash.new
		
		within(".bootstrap-table") do
			find(".form-control").set(name)
			sleep 3
			find(".dropdown-toggle").click
			sleep 2
			within(".dropdown-menu") do
				all('input[type=checkbox]').each do |checkbox|
					if checkbox.checked? then 
						checkbox.set(true)
					end
				end
			end
		end
		
		within(".fixed-table-body") do
			#headermap = first("thead").all("th").collect{ |column| column.text}
			colmap = first("tbody").all("tr")[0].all("td").collect{ |column| column.text}
			puts colmap	
		end
	
		arg1.each do |key,value|
			k = key
			v = value
			if colmap.to_s.include? v.to_s
				puts "#{k} : #{v} - is displayed on the grid"
			else
				putstr "#{k} : #{v} - is not displayed on the grid"
			end
		end
		
		# This appears not to work in older versions of Ruby (1.8.6). The following should be backwards compatible:
		# Hash[*keys.zip(values).flatten]
		#datamap = headermap.zip(colmap)
		# puts datamap
		# arg1.to_s.each do |key,value|
			# k = key
			# v = value
			# if datamap.to_s.any?{|hash| hash[k].include? v }
				# puts "#{k} : #{v} is displayed on the grid"
			# else
				# putstr "#{k} : #{v} is not displayed on the grid"
			# end
		# end
	rescue Exception =>ex
		putstr "Error while verifying fields of #{arg} in #{arg} section from Success Plan"
		putstr_withScreen  ex.message
	end
	
end

Then(/^I verify the count for "([^"]*)"$/) do |arg|
  begin
    sleep 5
		if all(".pagination-info").count > 0
			puts find(".pagination-info").text
			@recordCount = find(".pagination-info").text.split(/[^\d]/).last.to_i
			puts "No.of records on #{arg} grid: #{@recordCount}"
		else
			puts 0
			@recordCount = 0
		end
		sleep 3
	rescue Exception =>ex
		putstr "Error while verifying the count for #{arg}"
		putstr_withScreen  ex.message
	end
end
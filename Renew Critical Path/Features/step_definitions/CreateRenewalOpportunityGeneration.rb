#All Opportunity Generation - Create Renewal Opportunity From Assets,Create Renewal Opportunity From Source Opportunity specific Step definitions
#All Scenario mentioned in CreateRenewalOpportunityGenerationFromAssets.feature,CreateRenewalOpportunityFromSourceOpportunity.feature

Then (/^I select the Source Opportunity for Opportunity Generation from Opportunity$/) do
	begin
	sleep 5
	arg = getReference "generateOpp"
	select "My Opportunities", :from => "fcf"
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
				  if row.all("td")[2].text==arg["OppName"]
					row.all("td")[2].all('a')[0].click
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
				 if row.all("td")[2].text==arg["OppName"]
					row.all("td")[2].all('a')[0].click
					foundCount = "found"
					break
				  end	
				end
			end
		end
	sleep 5	
	rescue Exception => ex
		puts "Error in Selecting the source opportunity"
		putstr_withScreen  ex.message
	end
end

Then (/^I select the Renewal Opportunity for Opportunity Generation from Opportunity$/) do
	begin
	sleep 5
	arg = getDetails "OppGenerationDetails"
	select "My Opportunities", :from => "fcf"
		sleep 3
		within(".fBody") do
			click_on "Go!"
		end
		sleep 5
		foundCount = 0
		begin  
			within(".x-grid3-body") do
				tr = all(".x-grid3-row")				
				tr.each do |row|
				  if arg["Name"].include? row.all("td")[2].text
					row.all("td")[2].click
					foundCount = 1
					break
				  end	
				end
			end
			if foundCount==0
				if page.has_css?('.next')
					find(".next").click
					sleep 3
				else
					break
				end
			else
				break
			end
		end until (page.has_css?('.nextoff'))
		if foundCount==0
			within(".x-grid3-body") do
				tr = all(".x-grid3-row")
				tr.each do |row|
				 if arg["Name"].include? row.all("td")[2].text
					row.all("td")[2].click
					foundCount = 1
					break
				  end	
				end
			end
		end
	sleep 5	
	if foundCount==0
		puts "Opportunity not found."
	else
		puts "Opened Opportunity #{arg['Name']} Successfully."
	end
	rescue Exception => ex
		puts "Error in Selecting the Renewal Opportunity for Opportunity Generation "
		putstr_withScreen  ex.message
	end
end

Then (/^I generate Opportunity from Opportunity$/) do
begin
	arg = getDetails 'OppGenerationDetails'	
	within(:id,'bottomButtonRow') do
		click_on "Generate Opportunity"
	end
	arg.each do |key,val|
		fill_in key,:with => val
		puts "Filled value for " + key + " column"
		sleep 1
	end
	fill_in "Name",:with=>arg["Name"]+$Opp
  sleep 4
  within all(".opportunityBlock")[1] do
    within(".pbBody") do
   if first("tbody").first(".dataRow").all("td").count > 0
     $generate_opportunity_product = first("tbody").first(".dataRow").all("td")[1].first("span").text
   else
     puts "No Opportunity Products Available"
   end
  end
  end
  sleep 5
	click_on "Save"
  sleep 4
 rescue Exception => ex
	puts "Error in generating Opportunity from Opportunity"
	putstr_withScreen  ex.message
 end
end

Then (/^I check for the errors to be displayed while generating opportunity$/) do
begin	
	arg1 = getDetails 'WrongOppGenerationDetails'
	arg1.each do |key,val|
		fill_in key,:with => val
		#puts "Filled value for " + key + " column"
		sleep 1
	end
	all(".dataRow")[0].all(".dataCell")[2].first("input").set(nil)
	all(".dataRow")[0].all(".dataCell")[3].first("input").set(nil)
	click_on "Save"
		if find(".messageTable").has_content? "Errors"
			puts "Validation Error Message is displayed : " + find(".messageTable").text
		else
			raise "Validation Error Message is not displayed"
		end
rescue Exception => ex
	puts "Error in checking errors to be displayed"
	putstr_withScreen  ex.message
end
end

Then (/^I check for the errors to be displayed while generating opportunity for Opportunity$/) do
begin	
	within(:id,"bottomButtonRow") do
		click_on "Generate Opportunity"
	end
	arg1 = getDetails 'WrongOppGenerationDetails'
	arg1.each do |key,val|
		fill_in key,:with => val
		#puts "Filled value for " + key + " column"
		sleep 1
	end
	all(".dataRow")[0].all(".dataCell")[2].first("input").set(nil)
	all(".dataRow")[0].all(".dataCell")[3].first("input").set(nil)
	click_on "Save"
		if find(".messageTable").has_content? "Errors"
			puts "Validation Error Message is displayed : " + find(".messageTable").text
		else
			raise "Validation Error Message is not displayed"
		end
rescue Exception => ex
	puts "Error in checking errors to be displayed"
	putstr_withScreen  ex.message
end
end

And (/^I verify the generated opportunity for "(.*?)"$/) do |data|
begin
  sleep 4
	arg = getDetails data
	arg1 = getReference "ServiceContracts"
	if page.has_content? "Opportunity Detail"
		if all(:xpath,"//img[contains(@src, 'checkbox_checked.gif')]").count > 0
			puts "Renewal field is checked"
		else
			putstr "Renewal field is not checked"
    end
    sleep 3
		within all('.list')[0] do 
			tr = all(".dataRow")
			tr.each do |row|
				if (row.all(".dataCell")[0].text.include? $generate_opportunity_product)
					puts "#{$generate_opportunity_product} is same in source Opportunity"
				else
					putstr "#{$generate_opportunity_product} is not same in source Opportunity"
				end        
				break
			end
		end
		puts "Generated Opportunity verified."
	else
		raise "Opportunity Detail page not present."
	end
	rescue Exception => ex
		puts "Error in verifying the opportunity"
		putstr_withScreen  ex.message
	end
end

And (/^I delete the opportunity for "(.*?)"$/) do|data|
begin		
	sleep 5
	arg = getDetails data
	select "My Opportunities", :from => "fcf"
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
				  if row.all("td")[2].text==arg["Name"]+$Opp
					page.accept_confirm { row.first(:link,"Del").click }					
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
				 if row.all("td")[2].text==arg["Name"]+$Opp
					page.accept_confirm { row.first(:link,"Del").click }								
					foundCount = "found"
					break
				  end	
				end
			end
		end
	sleep 5	
	rescue Exception => ex
		puts "Error in Selecting and deleting the renewal opportunity"
		putstr_withScreen  ex.message
	end
end

Then(/^I create a new source Opportunity$/) do
begin
	click_on "New"
	arg = getDetails "newOpportunity"
	arg1 = getReference "newOpportunity"
	 fill_in "Opportunity Name",:with=>arg["Opportunity Name"]+$Opp
  # fill_in "Opportunity Name",:with=>arg["Opportunity Name"]
	select arg["Stage"],:from=>"Stage"	
	# lookup
		main = page.driver.browser.window_handles.first
		find("img[alt='Account Name Lookup (New Window)']").click
		sleep 5
		page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
		sleep 10
		page.driver.browser.switch_to.frame("resultsFrame")
		within('.list') do
			tr = first("tbody").all("tr")
			tr.each do |row|
				if row.all("th")[0].text == arg1["Account Name"]
						row.all("th")[0].all('a')[0].click
						break
				end                        
			end
		end
		sleep 3
		page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
        sleep 5
	#lookup
	fill_in "Close Date",:with=>arg["Close Date"]
	within(:id,'bottomButtonRow')do
		click_on "Save"
	end
	sleep 5
rescue Exception => ex
	putstr "Error in creating new source opportunity"
	putstr_withScreen  ex.message
end
end

# Then (/^I create a new source Opportunity for "(.*?)"$/) do |data|
# begin
	# click_on "New"
	# arg = getDetails data
	# fill_in "Opportunity Name",:with=>arg["Opportunity Name"]+$Opp
	# select arg["Stage"],:from=>"Stage"	
	#lookup
		# main = page.driver.browser.window_handles.first
		# find("img[alt='Account Name Lookup (New Window)']").click
		# sleep 5
		# page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
		# sleep 10
		# page.driver.browser.switch_to.frame("resultsFrame")
		# within('.list') do
			# tr = first("tbody").all("tr")
			# tr.each do |row|
				# if row.all("th")[0].text == arg["Account Name"]
						# row.all("th")[0].all('a')[0].click
						# break
				# end                        
			# end
		# end
		# sleep 3
		# page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
        # sleep 5
	#lookup
	# fill_in "Close Date",:with=>arg["Close Date"]
	# within(:id,'bottomButtonRow')do
		# click_on "Save"
	# end
	# sleep 5
# rescue Exception => ex
	# putstr "Error in creating new source opportunity"
	# putstr_withScreen  ex.message
# end
# end
#temporary

Then (/^I select the Renewal Opportunity$/) do
	begin
	sleep 5
	arg = getDetails "newOpportunity"
	select "My Opportunities", :from => "fcf"
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
				  if row.all("td")[2].text==arg["Opportunity Name"]+$Opp
           # if row.all("td")[2].text==arg["Opportunity Name"]
					row.all("td")[2].all("a")[0].click
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
				 if row.all("td")[2].text==arg["Opportunity Name"]+$Opp
					row.all("td")[2].all("a")[0].click
					foundCount = "found"
					break
				  end	
				end
			end
		end
	sleep 5	
	rescue Exception => ex
		puts "Error Selecting the Renewal opportunity"
		putstr_withScreen  ex.message
	end	
end

And(/^I select more than one product from the product grid$/) do
	begin
		sleep 6
		arg = getDetails "ProductOpportunity"
		arg1 = getReference "ProductOpportunity"
		within("#undefined_grid") do
			tr = all(".x-grid3-row")
			tr.each do |row|                                                                                              
				if row.all("td")[1].text==arg1["ProductA"]
					row.all('input[type=checkbox]').each do |checkbox |                                                                    
						unless checkbox.checked?
							checkbox.click
							puts "#{arg1["ProductA"]} is selected"
							break
						else
							putstr "#{arg1["ProductA"]} is not selected"
						end                                                                   
					end
					foundCount = "found"
					break
				end 
			end
		end
		sleep 5
		within("#undefined_grid") do
			tr = all(".x-grid3-row")
			tr.each do |row|
				if row.all("td")[1].text==arg1["ProductB"]
					row.all('input[type=checkbox]').each do |checkbox |                                                                    
						unless checkbox.checked?
							checkbox.click
							puts "#{arg1["ProductB"]} is selected"
							break
						else
							putstr "#{arg1["ProductB"]} is not selected"
						end                                                                   
					end
					foundCount = "found"
					break
				end        
			end     
		end
		sleep 4
		click_on 'Select'
		puts "Successfully select the product"
		sleep 6
		find(:xpath,"//*[@id='editPage']/table/tbody/tr[5]/td[3]/input").set arg["ProductQuantity"]
		sleep 5    
		find(:xpath,"//*[@id='editPage']/table/tbody/tr[9]/td[3]/input").set arg["ProductQuantity"]
		sleep 5	    
		all(:xpath,'//td/input[@value=" Save "]')[0].click
		sleep 6
  rescue Exception => ex
    putstr "Error occurred while selecting more than one product from the product grid"
    putstr_withScreen  ex.message
  end
end

And(/^I select the products for the new opportunity$/) do
  begin
    sleep 5
    arg = getDetails "ProductOpportunity"
    sleep 5
    within all(".pbBody")[1] do
      sleep 5
      $first_product_name = all(:xpath,"//table/tbody/tr/th/a")[0].text
      $second_product_name = all(:xpath,"//table/tbody/tr/th/a")[1].text
      sleep 5
      all('input[type=checkbox]').each_with_index do |checkbox , index|
        if index.to_i == arg["FirstProductCheckboxIndex"].to_i
          sleep 5
          unless checkbox.checked?
            checkbox.click
            puts "Enabled the the product"
          else
            puts "Product is already enabled"
          end
        else        
        end
      end
      sleep 5
      all('input[type=checkbox]').each_with_index do |checkbox , index|
        if index.to_i == arg["SecondProductCheckboxIndex"].to_i
          sleep 5
          unless checkbox.checked?
            checkbox.click
            puts "Enabled the the product"
          else
            puts "Product is already enabled"
          end
        else         
        end
      end
    end
  rescue Exception => ex
    putstr "Error occurred while shouldn't able to see the products"
    putstr_withScreen  ex.message
  end
end

Then (/^I set the covered asset$/) do
begin
	arg1 = getReference "ProductOpportunity"
	within all(".list")[0] do
		tr = all(".dataRow")
		tr.each do |row|
			if row.all(".dataCell")[0].text == arg1["ProductA"]
				row.all(".dataCell")[0].all("a")[0].click			
				break
			end	
		end
		
	end
	within(:id,"bottomButtonRow") do
		click_on "Edit"
	end
	main = page.driver.browser.window_handles.first
	find("img[alt='Covered Asset Lookup (New Window)'").click
	sleep 5
	page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
	sleep 10
	page.driver.browser.switch_to.frame("resultsFrame")
	within('.list') do
		tr = first("tbody").all("tr")
		tr.each do |row|
			if row.all("th")[0].text == arg1["CoveredAsset"]
				row.all("th")[0].all('a')[0].click
				break
			end                        
		end
	end
	sleep 3
	page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
	sleep 5
	within(:id,"bottomButtonRow") do
		click_on "Save"
	end
	
	rescue Exception => ex
		putstr "Error setting the covered asset"
		putstr_withScreen  ex.message
	end
end

Then (/^I Choose the Pricebook for the product$/) do
begin
	arg = getReference "Pricebooks"
	select arg["first"],:from=>"p1"
	click_on "Save"
rescue Exception => ex
	putstr "Error in choosing the pricebook for the product "
	putstr_withScreen  ex.message
end
end

Then (/^I set the covered product$/) do
begin
	arg = getReference "ProductOpportunity"
	within all(".list")[0] do
		tr = all(".dataRow")
		tr.each do |row|
			if row.all(".dataCell")[0].text == arg["ProductA"]
				row.all(".dataCell")[0].all("a")[0].click			
				break
			end	
		end
	end
	within(:id,"bottomButtonRow") do
		click_on "Edit"
	end
	main = page.driver.browser.window_handles.first
	find("img[alt='Covered Product Lookup (New Window)'").click
	sleep 5
	page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
	sleep 10
	page.driver.browser.switch_to.frame("resultsFrame")
	within('.list') do
		tr = first("tbody").all("tr")
		tr.each do |row|
			if row.all("th")[0].text == arg["CoveredProduct"]
					row.all("th")[0].all('a')[0].click
					break
			end                        
		end
	end
	sleep 3
	page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
	sleep 5
	within(:id,"bottomButtonRow") do
		click_on "Save"
	end
rescue Exception => ex
	putstr "Error setting covered product"
	putstr_withScreen  ex.message
end
end

# And (/^I select the resolved Opportunity for "(.*?)"$/) do |data|
# begin
	# sleep 5
	# arg = getDetails data
	# select "My Opportunities", :from => "fcf"
		# sleep 3
		# within(".fBody") do
			# click_on "Go!"
		# end
		# sleep 5
		# foundCount = ""
		# begin
			# within(".x-grid3-body") do
				# tr = all(".x-grid3-row")
				# tr.each do |row|
				  # if row.all("td")[2].text==arg["ResolvedOpportunity"]
					# row.all("td")[2].all("a")[0].click
					# foundCount = "found"
					# break
				  # end
				# end
			# end
			# if page.has_css?('.next')
				# find(".next").click
				# sleep 3
			# else
				# break
			# end
		# end until (page.has_css?('.nextoff'))
		# if foundCount==""
			# within(".x-grid3-body") do
				# tr = all(".x-grid3-row")
				# tr.each do |row|
				 # if row.all("td")[2].text==arg["ResolvedOpportunity"]
					# row.all("td")[2].all("a")[0].click
					# foundCount = "found"
					# break
				  # end
				# end
			# end
		# end
	# sleep 5

# rescue Exception => ex
	# putstr "Error in selecting the resolved opportunity"
	# putstr_withScreen  ex.message
# end
# end

Then (/^I select more than one Asset$/) do
begin
	arg= getReference "Asset"
	select "All Assets", :from => "fcf"
	within(".fBody") do
		click_on "Go!"
	end	
	sleep 5
	link = arg["Asset1"].chr
	link = link.upcase
	within(".rolodex") do
		first(:link,link).click
	end	
	# foundCount = ""
	# begin
		# within(".x-grid3-body") do
			# tr = all(".x-grid3-row")
			# tr.each do |row|
				# if row.all("td")[2].text==arg["Asset1"]
					# row.first('input[type=checkbox]').set(true)
					# row.all('input[type=checkbox]').each do |checkbox |
						# unless checkbox.checked?
							# checkbox.click
							# break
						# else
							# putstr "#{arg["Asset1"]} is not checked"

						# end
					# end
					# foundCount = "found"
					# break
				# end
			# end
		# end
		# if page.has_css?('.next')
			# find(".next").click
			# sleep 3
		# else
			# break
		# end
	# end until (page.has_css?('.nextoff'))
	# if foundCount == ""
		# within(".x-grid3-body") do
			# tr = all(".x-grid3-row")
			# tr.each do |row|
				# if row.all("td")[2].text==arg["Asset1"]
				# row.first('input[type=checkbox]').set(true)
					# row.all('input[type=checkbox]').each do |checkbox |
						# unless checkbox.checked?
						  # checkbox.click
						  # foundCount = "found"
						 # break
						# else
						 # putstr "#{arg["Asset1"]} is not checked"
						# end
					# end
					# foundCount = "found"
					# break
				# end
			# end
		# end
	# end
	foundCount = 0
		begin  
			within(".x-grid3-body") do
				tr = all(".x-grid3-row")
				tr.each do |row|
				  if row.all("td")[2].text == arg["Asset1"]
					row.first('input[type=checkbox]').set(true)
					foundCount = 1
					break


					exit
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
		if foundCount == 0
			within(".x-grid3-body") do
				tr = all(".x-grid3-row")
				tr.each do |row|
				 if row.all("td")[2].text==arg["Asset1"]
					row.first('input[type=checkbox]').set(true)
					foundCount = 1
					break
					exit
				  end	
				end
			end
		end



		if foundCount > 0
			puts "Selected the Asset '#{arg["Asset1"]}'"
		else
			putstr "#{arg["Asset1"]} not found to select"
		end

	sleep 5	
rescue Exception => ex	
	putstr "Error in selecting more than one Asset"
	putstr_withScreen  ex.message
end
end
And (/^I select the resolved Opportunity$/) do
begin
	sleep 5
	arg = getDetails "newOpportunity"
	select "My Opportunities", :from => "fcf"
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
				  if row.all("td")[2].text==arg["Opportunity Name"]+$Opp
           #  if row.all("td")[2].text==arg["Opportunity Name"]
					row.all("td")[2].all("a")[0].click
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
				 # if row.all("td")[2].text==arg["Opportunity Name"]+$Opp
           if row.all("td")[2].text==arg["Opportunity Name"]
					row.all("td")[2].all("a")[0].click
					foundCount = "found"
					break
				  end	
				end
			end
		end
	sleep 5
	if foundCount == "found"
		puts "Successfully navigated to the resolved opportunity page"
	else
		putstr "Resolved Opportunity is not selected"
	end
rescue Exception => ex
	putstr "Error in selecting the resolved opportunity"
	putstr_withScreen  ex.message
end
end

And (/^I verify the resolved opportunity$/) do
begin
	arg = getReference "ProductOpportunity"
	if all(:xpath,"//img[contains(@src, 'checkbox_checked.gif')]").count > 0	
		puts "renewal field is checked"
	else
		putstr "not found"
	end
	within all('.list')[0] do 
		tr = all(".dataRow")
		tr.each do |row|
			if (row.all(".dataCell")[0].text == arg["ProductA"])
					puts "#{arg['ProductA']} is the product same in source Opportunity"
			end
		end
	end
rescue Exception => ex
	putstr "Error in verifying the resolved opportunity"
	putstr_withScreen  ex.message
end
end

# And (/^I verify the resolved opportunity for "(.*?)"$/) do |data|
# begin
	# arg = getDetails data
	# if all(:xpath,"//img[contains(@src, 'checkbox_checked.gif')]").count > 0
	#if find("img[src='/img/checkbox_checked.gif'\]").count>0
		# puts "renewal field is checked"
	# else
		# putstr "not found"
	# end
	# within all('.list')[0] do 
		# tr = all(".dataRow")
		# tr.each do |row|		
		# if row.all(".dataCell")[0].text == arg["Product"]
				# puts "#{arg['Product']} is the product same in source Opportunity"
			# end
		# end
	# end
# rescue Exception => ex
	# putstr "Error in verifying the resolved opportunity"
	# putstr_withScreen  ex.message
# end
# end

# Then (/^I select the Opportunity$/) do
# begin
	# sleep 5
	# arg = getDetails "ProductOpportunity"
	# select "My Opportunities", :from => "fcf"
		# sleep 3
		# within(".fBody") do
			# click_on "Go!"
		# end
		# sleep 5
		# foundCount = ""
		# begin  
			# within(".x-grid3-body") do
				# tr = all(".x-grid3-row")				
				# tr.each do |row|
				  # if row.all("td")[2].text== arg["DeletingOpporunity"]
					# row.all("td")[2].all("a")[0].click
					# foundCount = "found"
					# break
				  # end	
				# end
			# end
			# if page.has_css?('.next')
				# find(".next").click
				# sleep 3
			# else
				# break
			# end
		# end until (page.has_css?('.nextoff'))
		# if foundCount==""
			# within(".x-grid3-body") do
				# tr = all(".x-grid3-row")
				# tr.each do |row|				
				 # if row.all("td")[2].text==arg["DeletingOpporunity"]
					# row.all("td")[2].all("a")[0].click
					# foundCount = "found"
					# break
				  # end	
				# end
			# end
		# end
	# sleep 5
# rescue Exception => ex	
	# putstr_withScreen  ex.message
# end
# end

And (/^I delete the product from the opportunity for "(.*?)"$/) do |data|
	begin
		arg = getReference data
		within all(".list")[0] do
			rows = all(".dataRow")
			rows.each do |row|
			puts row.all(".dataCell")[0].text 
				if row.all(".dataCell")[0].text == arg["productName"]			
					page.accept_confirm { row.first(:link,"Del").click }			
					break
				end	
			end
		end
	puts "Product successfully deleted from Opportunity"
	rescue Exception => ex	
		putstr "Error in deleting the product from the opportunity"
		putstr_withScreen  ex.message
	end
end

And (/^I delete the product from the opportunity$/) do
	begin
		arg = getReference "ProductOpportunity"
		within all(".list")[0] do
			tr = all(".dataRow")
			tr.each do |row|
				if row.all(".dataCell")[0].text == arg["ProductB"]
					page.accept_confirm { row.first(:link,"Del").click }			
					break
				end
			end							
		end
	puts "Product successfully deleted from Opportunity"
	rescue Exception => ex
		putstr "Error in deleting the product from the opportunity"
		putstr_withScreen  ex.message
	end
end

Then (/^I generate new opportunity from the asset$/) do
	begin
	ref = getReference "CreateAssetOpportunity"
	arg = getDetails "CreateAssetOpportunity"
	arg1 = getDetails "Asset"	
	pb = getReference "Pricebooks"
	arg.each do |key,val|
		fill_in key,:with => val		
		sleep 1
	end
    select pb["first"],:from=>  "Pricebook"

	fill_in "Owner ID",:with=>ref["Owner ID"]
	fill_in "Name",:with=>arg["Name"]+$Opp
	sleep 2
	select "Needs Analysis",:from=> "Stage"
	sleep 3	
	rows=all(".dataRow")
	rows.each do |row|
		row.all(".dataCell")[3].first("input").set(arg1["salesPrice1"])	
		row.all(".dataCell")[5].first("input").set(arg1["lineDesc1"])
	end
  sleep 4
  within all(".opportunityBlock")[1] do
    within(".pbBody") do
      if first("tbody").first(".dataRow").all("td").count > 0
        $generate_opportunity_product = first("tbody").first(".dataRow").all("td")[1].first("span").text
      else
        puts "No Opportunity Products Available"
      end
    end
  end
  sleep 4
	click_on "Save"
	puts "New Opportunity is generated"
  sleep 4
	rescue Exception => ex	
		putstr "Error in generating new opportunity from the asset"
		putstr_withScreen  ex.message
	end
end

Then (/^I select the existing Service Contract$/) do
	begin
	sleep 5
	arg = getReference "ServiceContracts"
	select "All Service Contracts", :from => "fcf"
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
				  if row.all("td")[2].text == arg["Contract Name"]
					row.all("td")[2].all("a")[0].click
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
				 if row.all("td")[2].text==arg["Contract Name"]
					row.all("td")[2].all("a")[0].click
					foundCount = "found"
					break
				  end	
				end
			end
		end
	sleep 5
	rescue Exception => ex	
		putstr "Error in selecting the existing Service Contract"
		putstr_withScreen  ex.message
	end
end


And (/^I select the renewal opportunity for "ServiceContracts"$/) do
	begin
		sleep 5
		arg = getDetails "SCOppGenerationDetails"
		select "My Opportunities", :from => "fcf"
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
					if row.all("td")[2].text== arg["Name"]+$Opp
						row.all("td")[2].all("a")[0].click
						puts "Successfully navigated to selected Opportunity"
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
					if row.all("td")[2].text==arg["Name"]+$Opp
						row.all("td")[2].all("a")[0].click
						puts "Successfully navigated to selected Opportunity"
						foundCount = "found"
						break
					end
				end
			end
		end
		sleep 5
	rescue Exception => ex
		putstr "Error in selecting the renewal opportunity for ServiceContracts"
		putstr_withScreen  ex.message
	end
end

Then (/^I select the existing Service Contract$/) do
	begin
		sleep 5
		arg = getReference "ServiceContracts"
		select "All Service Contracts", :from => "fcf"
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
					if row.all("td")[2].text== arg["Contract Name"]
						row.all("td")[2].all("a")[0].click
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
					if row.all("td")[2].text==arg["Contract Name"]
						row.all("td")[2].all("a")[0].click
						foundCount = "found"
						break
					end
				end
			end
		end
		sleep 5
	rescue Exception => ex
		putstr "Error in selecting the existing Service Contract"
		putstr_withScreen  ex.message
	end
end

And (/^I delete the product from the generated opportunity for "(.*?)"$/) do |data|
	begin
		sleep 5
		arg = getReference "ServiceContracts"
		within all(".list")[0] do
			puts all(".dataRow")[0].all(".dataCell")[0].text
			tr = all(".dataRow")
			tr.each do |row|
				if row.all(".dataCell")[0].text.to_s == arg["ProductB"]
					page.accept_confirm { row.first(:link,"Del").click }
					break
				end
			end
		end
	rescue Exception => ex
		putstr "Error in deleting the product from the generated opportunity for #{data}"
		putstr_withScreen  ex.message
	end
end

Then (/^I check for the errors to be displayed while generating opportunity for serviceContract$/) do
	begin
    sleep 3
    arg1 = getDetails 'WrongOppGenerationDetails'
		sleep 3
		arg1.each do |key,val|
			fill_in key,:with => val
			#puts "Filled value for " + key + " column"
			sleep 1
		end
		all(".dataRow")[0].all(".dataCell")[2].first("input").set(nil)
		all(".dataRow")[0].all(".dataCell")[3].first("input").set(nil)
		click_on "Save"
		if find(".messageTable").has_content? "Errors"
			puts "Validation Error Message is displayed : " + find(".messageTable").text
		else
			raise "Validation Error Message is not displayed"
		end
	rescue Exception => ex
		puts "Error in checking errors to be displayed"
		putstr_withScreen  ex.message
	end
end

Then (/^I generate Opportunity from Service Contract$/) do
	begin
		arg = getDetails 'SCOppGenerationDetails'
		within(:id,'bottomButtonRow') do
			click_on "Generate Opportunity"
		end

		arg.each do |key,val|
			fill_in key,:with => val
			puts "Filled value for " + key + " column"
			sleep 1
		end
		fill_in "Name",:with=>arg["Name"]+$Opp
		click_on "Save"
	rescue Exception => ex
		puts "Error in generating Opportunity from Service Contract"
		putstr_withScreen  ex.message
	end
end

And (/^I click on generate Opportunity button$/) do
  sleep 4
	within(:id,'bottomButtonRow') do
		click_on "Generate Opportunity"
  end
  sleep 3
end

Then (/^I select the Source Service Contract for Opportunity Generation from ServiceContract$/) do
	begin
		sleep 5
		arg = getReference "ServiceContracts"
		select "All Service Contracts", :from => "fcf"
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
					if row.all("td")[2].text==arg["Contract Name"]
						row.all("td")[2].all('a')[0].click
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
					if row.all("td")[2].text==arg["Contract Name"]
						row.all("td")[2].all('a')[0].click
						foundCount = "found"
						break
					end
				end
			end
		end
		sleep 5
	rescue Exception => ex
		puts "Error in Selecting the Source Service Contract"
		putstr_withScreen  ex.message
	end
end

And (/^I delete the resolved Opportunity$/) do
	begin
		deletedSource = 0
    found = 0
    within all(".customnotabBlock")[1] do
      tr = all(".dataRow")
      if tr.count>0
        found = 1
      else
        found = 0
      end
    end
    if found == 1
      within all(".customnotabBlock")[1] do
        tr = all(".dataRow")
        tr.each do |row|
          page.accept_confirm {row.first(:link,"Del").click}
          break
        end
          deletedSource = deletedSource+1
      end
    end
		if deletedSource > 0
			puts "Successfully deleted the source opportunities"
		else
			putstr "No source Oportunity present"
		end
		sleep 3
		within(:id,"bottomButtonRow")do
      page.accept_confirm {click_on "Delete"}
			puts "Successfully deleted the resolved opportunity"
		end
		sleep 3
	rescue Exception => ex
		puts "Error in deleting the resolved opportunity"
		putstr_withScreen  ex.message
	end
end

#All Opportunities - Opportunity Expiration Filter specific Step definitions
#All Scenario mentioned in OpportunityExpirationFilter.feature

Then (/^I check the current expiration quarter results$/) do
	begin
	arg1 = getDetails "ExpirationQuarter"
		within all(".ui-select-match")[1] do
			if find(:css, ".ng-binding.ng-scope").text == arg1['CurrentQuarter']
				puts "Expiration quarter is in current quarter '#{arg1['CurrentQuarter']}'."
			end
		end
		within all(".ui-grid-canvas")[1] do
			within all("div[role='gridcell']")[0] do
				sleep 3
				$currentQtrOpp = first("div").text				
			end
		end			
		sleep 3
	rescue Exception => ex
		puts "Error in checking the results current '#{arg1['CurrentQuarter']}' expiration quarter results"
		putstr_withScreen  ex.message
	end
end

And (/^I verify after the expiration quarter results$/) do
	begin	
	arg1 = getDetails "ExpirationQuarter"
		within all(".ui-select-match")[1] do
			find(:css, ".ng-binding.ng-scope").click 			
		end
		sleep 3
		find("input[placeholder='Select Quarter...']").send_keys arg1['ChangedQuarter']
		sleep 3
		puts "Successfully Set as '#{arg1['ChangedQuarter']}'"
		find("input[placeholder='Select Quarter...']").send_keys :enter
		sleep 3
		within all(".ui-select-match")[1] do
			if find(:css, ".ng-binding.ng-scope").text == arg1['ChangedQuarter']
				puts "Expiration quarter is in '#{arg1['ChangedQuarter']}' quarter"
			end
		end	
		sleep 3
		found = 0
		within all(".ui-grid-canvas")[1] do	
			tr = all(".ui-grid-row")			
			tr.each do |row|				
				if row.all("div[role='gridcell']")[0].text == $currentQtrOpp
					found = 1					
				else
					found = 0					
				end
			end
			if found == 1
				putstr "#{$currentQtrOpp} is present in the '#{arg1['ChangedQuarter']}'"
			else
				puts "#{$currentQtrOpp} is not present in the '#{arg1['ChangedQuarter']}'"
			end
		end	
		sleep 3
		within all(".ui-select-match")[1] do
			find(:css, ".ng-binding.ng-scope").click 			
		end
		sleep 3
		find("input[placeholder='Select Quarter...']").send_keys arg1['AllQuarter']
		sleep 3
		puts "Successfully Set as '#{arg1['AllQuarter']}'"
		find("input[placeholder='Select Quarter...']").send_keys :enter
		sleep 3
		within all(".ui-grid-canvas")[1] do	
			tr = all(".ui-grid-row")
			#td = all("div[role='gridcell']")
			tr.each do |row|				
				if row.all("div[role='gridcell']")[0].text == $currentQtrOpp
					found = 1					
				else
					found = 0					
				end
			end
			if found == 1
				puts "#{$currentQtrOpp} is present in the '#{arg1['ChangedQuarter']}'"
			else
				putstr "#{$currentQtrOpp} is not present in the '#{arg1['ChangedQuarter']}'"
			end
		end	
	rescue Exception => ex
		puts "Error in verifying after changing the expiration quarter results"
		putstr_withScreen  ex.message
	end
end




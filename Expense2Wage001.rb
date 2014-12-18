# This program transform all E36 expense  to training wage S21

filename = Dir.entries('.').detect {|f| f.match /^_(\d{4})-(\d{2})-(\d{2})/}

require 'csv'

#check = '_2014-12-01.csv' #Opening the file
#filename = '_2014-12-01.csv'.match /^_(\d{4})-(\d{2})-(\d{2}).csv/
#filename = check

original = CSV.read(filename.to_s)
modified = []
output   = filename.to_s
output[0]='W'

CSV.open(output, 'w') do |obj|
	original.each do |row|
		if  row[3] == 'Expense' then  #check if it's expense
			row[3] = 'Hourly Reg'  #Derick said put Hourly Reg
			row[5] = 'S'	#Derick said S21
			row[6] = '21'   #Derick said S21
			row[7] = '10'   #set hourly rate
			row[8] = ((row[14].to_f)/(row[7].to_i)).to_s #hour
			row[25] = '0'  #column z
		end
		obj << row
	end
end	
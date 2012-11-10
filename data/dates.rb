require 'csv'

def numeric? x
  ! x.match(/\A[0-9]+\Z/).nil?
end

dates = ["April 2004","May 2004","June 2004","July 2004","August 2004","September 2004","October 2004","November 2004","December 2004","January 2005","February 2005","March 2005","April 2005","May 2005","June 2005","July 2005","August 2005","September 2005","October 2005","November 2005","December 2005","January 2006","February 2006","March 2006","April 2006","May 2006","June 2006","July 2006","August 2006","September 2006","October 2006","November 2006","December 2006","January 2007","February 2007","March 2007","April 2007","May 2007","June 2007","July 2007","August 2007","September 2007","October 2007","November 2007","December 2007","January 2008","February 2008","March 2008","April 2008","May 2008","June 2008","July 2008","August 2008","September 2008","October 2008","November 2008","December 2008","January 2009","February 2009","March 2009","April 2009","May 2009","June 2009","July 2009","August 2009","September 2009","October 2009","November 2009","December 2009","January 2010","February 2010","March 2010","April 2010","May 2010","June 2010","July 2010","August 2010","October 2010","November 2010","December 2010","January 2011","February 2011","March 2011","April 2011","May 2011","June 2011","July 2011","August 2011","September 2011","October 2011","November 2011","December 2011","January 2012","February 2012","March 2012","April 2012","May 2012","June 2012","July 2012","August 2012","September 2012"]

results = []

countSinceLastArea = 0

CSV.foreach('data/data.csv') do |row|
  unless row[0].nil?
    if row[0].start_with? 'Industry'
      industry = row[0].split(':')[1]
      puts "INDUSTRY: #{industry}"
    elsif ! numeric? row[0]
      area = row[0]
      puts "AREA: #{area}"
      countSinceLastArea = 0
    else
      puts "values row"
      results << [industry, area, row, dates[countSinceLastArea]]
      countSinceLastArea += 1
    end
  end
end

puts "hi"
puts results

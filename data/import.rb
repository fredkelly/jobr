require 'pg'
conn = PGconn.open('ec2-54-243-62-232.compute-1.amazonaws.com', 5432, '', '', 'dcqi3qigqol656', 'jezljnhcjqurqt', 'GKCDXOuHvlLjUFFlxnpzGZSJ_x')

vacancies = File.new('data/Vacancies.sql', 'r')

vacancies.read.each_line {|line| conn.exec(line)}

require 'pg'
conn = PGconn.open('ec2-54-243-62-232.compute-1.amazonaws.com', 5432, '', '', 'dcqi3qigqol656', 'jezljnhcjqurqt', 'GKCDXOuHvlLjUFFlxnpzGZSJ_x')

areas = File.new('data/Area.sql', 'r')
job_types = File.new('data/JobType.sql', 'r')
vacancies = File.new('data/Vacancies.sql', 'r')

conn.exec(areas)
conn.exec(job_types)
conn.exec(vacancies)

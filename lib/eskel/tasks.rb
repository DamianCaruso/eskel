%w(
  environment
  console  
).each do |task|
  load "eskel/tasks/#{task}.rake"
end
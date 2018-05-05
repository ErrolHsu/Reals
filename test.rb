record = File.open('/Users/s20a3264/pro/use_reals/debug.txt', 'w')
old_stdout = $stdout
$stdout = record
$stderr = $stdout
puts "this is a record!!!!!!"

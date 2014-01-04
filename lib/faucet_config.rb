
path = File.expand_path('../../config/config.yml', __FILE__)
FaucetConfig = YAML.load(File.read(path))

def FaucetConfig.request_time_frame_duration
  amount, unit = self["request_time_frame_duration"].split
  amount = amount.to_f
  case unit
  when nil, "second", "seconds"
  when "minute", "minutes"
    amount *= 60
  when "hour", "hours"
    amount *= 3600
  when "day", "days"
    amount *= 24 * 3600
  else
    raise "Invalid time unit: #{unit.inspect}"
  end
  amount
end

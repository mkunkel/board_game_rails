require 'vcr'

VCR.configure do |c|
  c.hook_into :webmock
  c.cassette_library_dir = 'features/cassettes'
  c.ignore_localhost = true
end

VCR.cucumber_tags do |t|
  t.tag '@localhost_request' # uses default record mode since no options are given
  t.tags '@disallowed_1', '@disallowed_2', record: :none
  t.tag '@vcr', use_scenario_name: true
end

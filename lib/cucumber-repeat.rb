require 'colorize'

After('@repeat') do | scenario |

  if (scenario.failed?)
    scenario.steps.each do |step_details|
      step_details.status!(:passed)
    end
    $stdout.puts "  Test Failed, Retrying test".blue
    run_scenario(scenario)
  end
  if (scenario.failed?)
    scenario.steps.each do |step_details|
      step_details.status!(:passed)
    end
    $stdout.puts "  Test Failed, Retrying test".blue
    run_scenario(scenario)
  end
end


def run_scenario(scenario)
  scenario.steps.each do |step_details|
    if (!scenario.failed?)
      begin
        step step_details.name.to_s, step_details.multiline_arg
        $stdout.puts "    " + step_details.name.strip.green
        if (!step_details.multiline_arg.to_s.empty?) then
          $stdout.puts "  " + step_details.multiline_arg.to_s.gsub(/\e\[(\d+)m/, '').strip.green
        end
        step_details.status!(:passed)
      rescue Exception => e
        $stdout.puts "    " + step_details.name.strip.red
        if (!step_details.multiline_arg.to_s.empty?) then
          $stdout.puts "  " + step_details.multiline_arg.to_s.gsub(/\e\[(\d+)m/, '').strip.red
        end
        $stdout.puts e.to_s.red
        step_details.status!(:failed)
      end
    else
      $stdout.puts "    " + step_details.name.strip.yellow
      if (!step_details.multiline_arg.to_s.empty?) then
        $stdout.puts "  " + step_details.multiline_arg.to_s.gsub(/\e\[(\d+)m/, '').strip.yellow
      end
    end
  end
end

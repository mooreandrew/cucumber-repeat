require 'colorize'

$coloured_output = true

WINDOWS       = RbConfig::CONFIG['host_os'] =~ /mswin|mingw/

if (WINDOWS.nil?) then
  $coloured_output =true
elsif (!ENV['ANSICON'].nil?) then
  $coloured_output =false
end


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
        $stdout.puts "    " + green_text(step_details.name.strip)
        if (!step_details.multiline_arg.to_s.empty?) then
          $stdout.puts "  " + green_text(step_details.multiline_arg.to_s.gsub(/\e\[(\d+)m/, '').strip)
        end
        step_details.status!(:passed)
      rescue Exception => e
        $stdout.puts "    " + red_text(step_details.name.strip)
        if (!step_details.multiline_arg.to_s.empty?) then
          $stdout.puts "  " + red_text(step_details.multiline_arg.to_s.gsub(/\e\[(\d+)m/, '').strip)
        end
        $stdout.puts e.to_s.red
        step_details.status!(:failed)
      end
    else
      $stdout.puts "    " + yellow_text(step_details.name.strip)
      if (!step_details.multiline_arg.to_s.empty?) then
        $stdout.puts "  " + yellow_text(step_details.multiline_arg.to_s.gsub(/\e\[(\d+)m/, '').strip)
      end
    end
  end
end

def green_text(text)

  if ($coloured_output == true) then
    text = text.green
  end
  return text
end

def red_text(text)

  if ($coloured_output == true) then
    text = text.red
  end
  return text
end

def yellow_text(text)

  if ($coloured_output == true) then
    text = text.yellow
  end
  return text
end

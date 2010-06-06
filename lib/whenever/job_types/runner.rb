module Whenever
  module Job
    class Runner < Whenever::Job::Default

      def output
        path_required

        # single-quote and escape the ruby code for bash
        sanitized = task.gsub(/'/) { |m| "'\\''" }

        %Q(cd #{File.join(@path)} && script/runner -e #{@environment} '#{sanitized}')
      end
      
    end
  end
end

##
# Task logvisual gem
#
module Logvisual
  ##
  # Task
  #
  class Task < Api
    ##
    # Create new task
    #
    def self.create(task, token)
      fail 'Please send task' if task.empty?
      send_request('/task/create', { content: task }, token)
    end

    ##
    # Get list
    #
    def self.list(token)
      send_request('/task/list', {}, token)
    end
  end
end

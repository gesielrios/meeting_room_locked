module SchedulerHelper
    def headers
        return ['Schedule', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday']
    end
    
    def schedules
        return (6..23).to_a
    end

    def schedule_format(schedule)
        schedule = schedule.to_s
        if schedule.size == 1
            schedule = "0" + schedule
        end
        return "#{schedule}:00"
    end
end

class Task < ActiveRecord::Base

  validates_presence_of :task_type, :task_name, :assigned_to, :due_date, :lead_for_task

  belongs_to :user

  DUE_DATES = [['Overdue','overdue'],['Asap', 'asap'],['Today', 'today'],['Tomorrow', 'tomorrow'],['This week', 'this_week'],['Next week','next_week'],['Sometime later','sometime_later']]
  TASK_TYPES = [['Call','call'], ['Email','email'], ['Follow-up', 'followup'], ['Meeting', 'meeting']]
  class << self
    def due_dates
      DUE_DATES
    end

    def task_type
      TASK_TYPES
    end
  end

end

# Todo
class Todo < ApplicationRecord
  belongs_to :project
  belongs_to :developer, class_name: 'User', foreign_key: 'developer_id', optional: true

  enum complexity: { high: 0, medium: 1, low: 2 }
  enum status: { in_progress: 0, complete: 1, block: 2 }
end

class Construction < ActiveRecord::Base
    belongs_to :client
    belongs_to :project_manager
end
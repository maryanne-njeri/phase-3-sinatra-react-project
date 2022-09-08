class Client < ActiveRecord::Base
    has_many :constructions
    has_many :project_managers, through: :constructions
end
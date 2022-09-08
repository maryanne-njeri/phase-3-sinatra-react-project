class Project_manager < ActiveRecord::Base
    has_many :constructions
    has_many :clients, through: :constructions
end
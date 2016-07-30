class Host < ApplicationRecord
	has_many :couches, dependent: :destroy
end

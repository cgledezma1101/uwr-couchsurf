class Host < ApplicationRecord
	has_many :couches, dependent: :destroy

	def available_couches
		return self.couches.where(occupant_name: nil)
	end
end

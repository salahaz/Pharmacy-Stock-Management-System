class TierLogic

def CalculatePPV (tier, pph, is_flat)
	if is_flat == true
		return pph + tier
	else
		return pph + pph * (tier / 100)
	end
end


end
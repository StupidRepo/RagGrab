local function Pickup( ply, obj )
	if ( obj:IsPlayerHolding() ) then return end
    if( obj:GetClass() == "prop_ragdoll" and obj:GetPos():Distance(ply:GetPos()) <= 100 )  then
	    ply:PickupObject( obj )
    end
end

concommand.Add('rg_pickup', function(ply, cmd, args) Pickup(ply, ply:GetEyeTrace().Entity) end)

hook.Add("KeyPress", "PBD_PickupRag", function(ply, key)
	if (ply:KeyPressed(IN_USE)) then
		Pickup(ply, ply:GetEyeTrace().Entity)
	end
end)
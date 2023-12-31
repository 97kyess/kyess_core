local relationshipTypes = {
	`GANG_1`,
	`GANG_2`,
	`GANG_9`,
	`GANG_10`,
	`AMBIENT_GANG_LOST`,
	`AMBIENT_GANG_MEXICAN`,
	`AMBIENT_GANG_FAMILY`,
	`AMBIENT_GANG_BALLAS`,
	`AMBIENT_GANG_MARABUNTE`,
	`AMBIENT_GANG_CULT`,
	`AMBIENT_GANG_SALVA`,
	`AMBIENT_GANG_WEICHENG`,
	`AMBIENT_GANG_HILLBILLY`,
	`DEALER`,
	`COP`,
	`PRIVATE_SECURITY`,
	`SECURITY_GUARD`,
	`ARMY`,
	`MEDIC`,
	`FIREMAN`,
	`HATES_PLAYER`,
	`NO_RELATIONSHIP`,
	`SPECIAL`,
	`MISSION2`,
	`MISSION3`,
	`MISSION4`,
	`MISSION5`,
	`MISSION6`,
	`MISSION7`,
	`MISSION8`
}

CreateThread(function()
	for i = 1, #relationshipTypes do
		SetRelationshipBetweenGroups(1, relationshipTypes[i], `PLAYER`)
	end
end)
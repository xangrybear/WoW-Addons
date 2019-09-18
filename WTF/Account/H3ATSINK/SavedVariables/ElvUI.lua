
ElvDB = {
	["profileKeys"] = {
		["Zombear - Skeram"] = "Damage",
		["Falcorne - Skeram"] = "Damage",
		["Quizzel - Atiesh"] = "Damage",
		["Garlicbear - Skeram"] = "Heal",
	},
	["gold"] = {
		["Atiesh"] = {
			["Quizzel"] = 92,
		},
		["Skeram"] = {
			["Zombear"] = 1474,
			["Falcorne"] = 1745,
			["Garlicbear"] = 101913,
		},
	},
	["class"] = {
		["Atiesh"] = {
			["Quizzel"] = "ROGUE",
		},
		["Skeram"] = {
			["Zombear"] = "MAGE",
			["Falcorne"] = "HUNTER",
			["Garlicbear"] = "PRIEST",
		},
	},
	["global"] = {
		["general"] = {
			["UIScale"] = 0.53333,
		},
		["unitframe"] = {
			["ChannelTicks"] = {
				[47540] = 3,
			},
			["buffwatch"] = {
				["PRIEST"] = {
					[6076] = {
						["enabled"] = true,
						["anyUnit"] = false,
						["point"] = "TOPRIGHT",
						["color"] = {
							["b"] = 0.117647058823529,
							["g"] = 1,
							["r"] = 0.407843137254902,
						},
						["id"] = 6076,
						["xOffset"] = 0,
						["style"] = "coloredIcon",
						["yOffset"] = 0,
					},
				},
			},
		},
	},
	["profiles"] = {
		["Heal"] = {
			["databars"] = {
				["artifact"] = {
					["textFormat"] = "CURREM",
					["fontOutline"] = "OUTLINE",
					["height"] = 9,
					["orientation"] = "HORIZONTAL",
					["textSize"] = 10,
					["width"] = 412,
				},
				["experience"] = {
					["orientation"] = "HORIZONTAL",
					["height"] = 9,
					["hideAtMaxLevel"] = false,
					["width"] = 412,
				},
				["azerite"] = {
					["orientation"] = "HORIZONTAL",
					["height"] = 9,
					["width"] = 412,
				},
				["reputation"] = {
					["enable"] = true,
					["height"] = 9,
					["orientation"] = "HORIZONTAL",
					["width"] = 412,
				},
				["honor"] = {
					["textFormat"] = "CURREM",
					["fontOutline"] = "OUTLINE",
					["height"] = 9,
					["orientation"] = "HORIZONTAL",
					["textSize"] = 10,
					["width"] = 412,
				},
			},
			["currentTutorial"] = 3,
			["general"] = {
				["loginmessage"] = false,
				["interruptAnnounce"] = "SAY",
				["topPanel"] = false,
				["bordercolor"] = {
					["r"] = 0,
					["g"] = 0,
					["b"] = 0,
				},
				["autoRepair"] = "PLAYER",
				["minimap"] = {
					["icons"] = {
						["classHall"] = {
							["xOffset"] = 39,
						},
					},
					["size"] = 195,
				},
				["bottomPanel"] = false,
				["valuecolor"] = {
					["r"] = 0.99,
					["g"] = 0.99,
					["b"] = 0.99,
				},
				["afk"] = false,
				["totems"] = {
					["enable"] = false,
				},
				["autoRoll"] = true,
			},
			["v11NamePlateReset"] = true,
			["hideTutorial"] = true,
			["auras"] = {
				["debuffs"] = {
					["countFontSize"] = 12,
					["durationFontSize"] = 12,
				},
				["buffs"] = {
					["countFontSize"] = 12,
					["durationFontSize"] = 12,
				},
				["font"] = "PT Sans Narrow",
				["fontOutline"] = "NONE",
			},
			["layoutSet"] = "healer",
			["thinBorderColorSet"] = true,
			["CBO"] = {
				["player"] = {
					["overlayOnFrame"] = "HEALTH",
				},
			},
			["movers"] = {
				["ElvUF_FocusCastbarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,0,270",
				["RaidMarkerBarAnchor"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,232",
				["MinimapButtonAnchor"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-242",
				["ElvUF_RaidMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMLEFT,1592,273",
				["LeftChatMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,1",
				["BuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-206,-30",
				["BossButton"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,526,357",
				["LootFrameMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,190,-191",
				["ZoneAbility"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,526,357",
				["ElvUF_RaidpetMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,3,667",
				["ElvUF_FocusMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,0,288",
				["ElvUF_PetCastbarMover"] = "TOP,ElvUIParent,TOP,-256,-4",
				["VehicleSeatMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,0,-7",
				["ExperienceBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,181",
				["ElvUF_TargetTargetMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-711,199",
				["LossControlMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,509,357",
				["ElvUF_Raid40Mover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMLEFT,1485,137",
				["ElvUF_TargetMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-416,199",
				["ElvAB_1"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,416,1",
				["ElvAB_2"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,416,25",
				["PetAB"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-252,297",
				["ElvAB_4"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,416,73",
				["TalkingHeadFrameMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,0,403",
				["ReputationBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,189",
				["AzeriteBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,197",
				["ElvAB_3"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,416,49",
				["ElvAB_5"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,416,97",
				["ArtifactBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,208",
				["ElvUF_PlayerMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,416,199",
				["ElvUF_PetMover"] = "TOP,ElvUIParent,TOP,-256,-24",
				["ObjectiveFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-59,-314",
				["BNETMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-4",
				["ShiftAB"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,63,236",
				["ArenaHeaderMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-338",
				["HonorBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,1,181",
				["ElvAB_6"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,416,122",
				["TooltipMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,149,270",
				["ElvUF_TankMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,0,728",
				["BossHeaderMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,0,-138",
				["TotemBarMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,514,-186",
				["ElvNP_PlayerMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-79",
				["ElvUF_PartyMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,1205,513",
				["ElvUF_PlayerCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,557",
				["DebuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-206,-174",
				["ElvUF_AssistMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,0,663",
			},
			["tooltip"] = {
				["fontSize"] = 12,
				["healthBar"] = {
					["font"] = "PT Sans Narrow",
				},
				["visibility"] = {
					["combat"] = true,
				},
			},
			["unitframe"] = {
				["smoothbars"] = true,
				["colors"] = {
					["auraBarBuff"] = {
						["r"] = 0,
						["g"] = 1,
						["b"] = 0.59,
					},
					["castClassColor"] = true,
					["healthclass"] = true,
				},
				["fontOutline"] = "OUTLINE",
				["font"] = "2002",
				["units"] = {
					["targettargettarget"] = {
						["health"] = {
							["frequentUpdates"] = true,
						},
					},
					["pet"] = {
						["health"] = {
							["frequentUpdates"] = true,
						},
						["castbar"] = {
							["height"] = 4.00005483627319,
							["width"] = 126.667526245117,
						},
					},
					["focustarget"] = {
						["health"] = {
							["frequentUpdates"] = true,
						},
					},
					["targettarget"] = {
						["health"] = {
							["frequentUpdates"] = true,
						},
					},
					["pettarget"] = {
						["health"] = {
							["frequentUpdates"] = true,
						},
					},
					["arena"] = {
						["health"] = {
							["frequentUpdates"] = true,
						},
						["castbar"] = {
							["height"] = 4.00005483627319,
							["width"] = 196.001281738281,
						},
					},
					["player"] = {
						["health"] = {
							["frequentUpdates"] = true,
						},
						["castbar"] = {
							["height"] = 13,
							["insideInfoPanel"] = false,
							["width"] = 271,
						},
					},
					["raid40"] = {
						["health"] = {
							["frequentUpdates"] = true,
						},
						["healPrediction"] = {
							["enable"] = true,
						},
						["height"] = 30,
						["groupBy"] = "ROLE",
						["rdebuffs"] = {
							["font"] = "PT Sans Narrow",
						},
						["growthDirection"] = "LEFT_UP",
					},
					["focus"] = {
						["health"] = {
							["frequentUpdates"] = true,
						},
						["castbar"] = {
							["height"] = 4.00003290176392,
							["width"] = 186.667816162109,
						},
					},
					["target"] = {
						["health"] = {
							["frequentUpdates"] = true,
						},
						["castbar"] = {
							["height"] = 6.66671419143677,
							["width"] = 266.668365478516,
						},
					},
					["raid"] = {
						["horizontalSpacing"] = 2,
						["debuffs"] = {
							["anchorPoint"] = "TOPRIGHT",
							["sizeOverride"] = 16,
							["xOffset"] = -4,
							["enable"] = true,
							["noDuration"] = true,
							["yOffset"] = -7,
						},
						["power"] = {
							["height"] = 11,
						},
						["healPrediction"] = {
							["enable"] = true,
						},
						["numGroups"] = 8,
						["growthDirection"] = "LEFT_UP",
						["infoPanel"] = {
							["enable"] = true,
						},
						["rdebuffs"] = {
							["enable"] = false,
							["font"] = "PT Sans Narrow",
						},
						["health"] = {
							["frequentUpdates"] = true,
						},
						["groupBy"] = "ROLE",
						["height"] = 66,
						["buffs"] = {
							["sizeOverride"] = 22,
							["useBlacklist"] = false,
							["enable"] = true,
							["playerOnly"] = false,
							["yOffset"] = -6,
							["clickThrough"] = true,
							["noDuration"] = false,
							["perrow"] = 1,
							["useFilter"] = "TurtleBuffs",
							["xOffset"] = 50,
						},
						["raidWideSorting"] = false,
						["width"] = 123,
					},
					["boss"] = {
						["health"] = {
							["frequentUpdates"] = true,
						},
						["castbar"] = {
							["height"] = 4.00005483627319,
							["width"] = 213.33464050293,
						},
					},
					["party"] = {
						["horizontalSpacing"] = 1,
						["debuffs"] = {
							["xOffset"] = -4,
							["sizeOverride"] = 13,
							["anchorPoint"] = "TOPRIGHT",
							["yOffset"] = -7,
						},
						["power"] = {
							["text_format"] = "",
						},
						["rdebuffs"] = {
							["font"] = "PT Sans Narrow",
						},
						["healPrediction"] = {
							["enable"] = true,
						},
						["width"] = 150,
						["growthDirection"] = "DOWN_RIGHT",
						["buffs"] = {
							["sizeOverride"] = 22,
							["useBlacklist"] = false,
							["enable"] = true,
							["playerOnly"] = false,
							["yOffset"] = -6,
							["anchorPoint"] = "CENTER",
							["clickThrough"] = true,
							["noDuration"] = false,
							["perrow"] = 5,
							["useFilter"] = "TurtleBuffs",
							["xOffset"] = 50,
						},
						["name"] = {
							["text_format"] = "[namecolor][name:short]",
							["position"] = "TOP",
						},
						["health"] = {
							["frequentUpdates"] = true,
							["text_format"] = "[healthcolor][health:deficit]",
							["position"] = "BOTTOM",
						},
						["roleIcon"] = {
							["position"] = "LEFT",
						},
						["height"] = 65,
						["groupBy"] = "ROLE",
						["petsGroup"] = {
							["anchorPoint"] = "RIGHT",
							["enable"] = true,
							["height"] = 41,
							["width"] = 105,
						},
						["buffIndicator"] = {
							["size"] = 10,
						},
					},
				},
			},
			["datatexts"] = {
				["fontOutline"] = "MONOCHROMEOUTLINE",
				["panels"] = {
					["LeftMiniPanel"] = "Time",
					["RightMiniPanel"] = "Currencies",
					["BottomMiniPanel"] = "Bags",
					["LeftChatDataPanel"] = {
						["right"] = "O Item Level",
						["left"] = "System",
						["middle"] = "",
					},
				},
				["rightChatPanel"] = false,
			},
			["actionbar"] = {
				["bar3"] = {
					["showGrid"] = false,
					["buttonsPerRow"] = 12,
					["buttonsize"] = 25,
					["buttons"] = 12,
				},
				["bar6"] = {
					["enabled"] = true,
					["buttonsize"] = 25,
					["showGrid"] = false,
				},
				["bar2"] = {
					["enabled"] = true,
					["buttonsize"] = 25,
					["showGrid"] = false,
				},
				["bar1"] = {
					["showGrid"] = false,
					["buttonsize"] = 25,
				},
				["bar5"] = {
					["showGrid"] = false,
					["buttonsPerRow"] = 12,
					["buttonsize"] = 25,
					["buttons"] = 12,
				},
				["font"] = "PT Sans Narrow",
				["globalFadeAlpha"] = 1,
				["backdropSpacingConverted"] = true,
				["barPet"] = {
					["enabled"] = false,
				},
				["bar4"] = {
					["point"] = "BOTTOMLEFT",
					["showGrid"] = false,
					["buttonsPerRow"] = 12,
					["backdrop"] = false,
					["buttonsize"] = 25,
				},
			},
			["watchframe"] = {
				["city"] = "NONE",
			},
			["bags"] = {
				["junkIcon"] = true,
				["countFont"] = "PT Sans Narrow",
				["itemLevelFont"] = "PT Sans Narrow",
				["moneyFormat"] = "FULL",
				["currencyFormat"] = "ICON",
				["countFontSize"] = 12,
				["itemLevelFontSize"] = 12,
				["vendorGrays"] = {
					["enable"] = true,
				},
			},
			["chat"] = {
				["fontSize"] = 12,
				["panelBackdrop"] = "LEFT",
				["panelColorConverted"] = true,
				["panelWidthRight"] = 400,
				["tapFontSize"] = 12,
				["panelTabBackdrop"] = true,
			},
		},
		["Minimalistic"] = {
			["currentTutorial"] = 2,
			["general"] = {
				["font"] = "Expressway",
				["bottomPanel"] = false,
				["backdropfadecolor"] = {
					["a"] = 0.80000001192093,
					["r"] = 0.058823529411765,
					["g"] = 0.058823529411765,
					["b"] = 0.058823529411765,
				},
				["reputation"] = {
					["orientation"] = "HORIZONTAL",
					["textFormat"] = "PERCENT",
					["height"] = 16,
					["width"] = 200,
				},
				["bordercolor"] = {
					["r"] = 0.30588235294118,
					["g"] = 0.30588235294118,
					["b"] = 0.30588235294118,
				},
				["valuecolor"] = {
					["a"] = 1,
					["r"] = 1,
					["g"] = 1,
					["b"] = 1,
				},
				["fontSize"] = 11,
			},
			["movers"] = {
				["PetAB"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-50,-428",
				["ElvUF_RaidMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,51,120",
				["LeftChatMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,50,50",
				["GMMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,250,-50",
				["BossButton"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-117,-298",
				["LootFrameMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,249,-216",
				["ElvUF_RaidpetMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,50,827",
				["MicrobarMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-52",
				["VehicleSeatMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,51,-87",
				["ElvUF_TargetTargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,143",
				["ElvUF_Raid40Mover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,392,1073",
				["ElvAB_1"] = "BOTTOM,ElvUIParent,BOTTOM,0,50",
				["ElvAB_2"] = "BOTTOM,ElvUIParent,BOTTOM,0,90",
				["ElvAB_4"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-50,-394",
				["AltPowerBarMover"] = "TOP,ElvUIParent,TOP,0,-186",
				["ElvAB_3"] = "BOTTOM,ElvUIParent,BOTTOM,305,50",
				["ElvAB_5"] = "BOTTOM,ElvUIParent,BOTTOM,-305,50",
				["MinimapMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-50,-50",
				["ElvUF_TargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,230,140",
				["ObjectiveFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-122,-393",
				["BNETMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,50,232",
				["ShiftAB"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,50,1150",
				["ElvUF_PlayerCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,133",
				["ElvUF_PartyMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,184,773",
				["ElvAB_6"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-488,330",
				["TooltipMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-50,50",
				["ElvUF_TankMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,50,995",
				["ElvUF_PetMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,200",
				["ElvUF_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,-230,140",
				["TotemBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,463,50",
				["RightChatMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-50,50",
				["AlertFrameMover"] = "TOP,ElvUIParent,TOP,0,-50",
				["ReputationBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-50,-228",
				["ElvUF_AssistMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,51,937",
			},
			["bags"] = {
				["itemLevelFontSize"] = 9,
				["countFontSize"] = 9,
			},
			["hideTutorial"] = true,
			["auras"] = {
				["font"] = "Expressway",
				["buffs"] = {
					["countFontSize"] = 11,
					["maxWraps"] = 2,
					["durationFontSize"] = 11,
				},
				["debuffs"] = {
					["countFontSize"] = 11,
					["durationFontSize"] = 11,
				},
			},
			["unitframe"] = {
				["statusbar"] = "ElvUI Blank",
				["fontOutline"] = "THICKOUTLINE",
				["smoothbars"] = true,
				["font"] = "Expressway",
				["fontSize"] = 9,
				["units"] = {
					["tank"] = {
						["enable"] = false,
					},
					["targettarget"] = {
						["infoPanel"] = {
							["enable"] = true,
						},
						["debuffs"] = {
							["enable"] = false,
						},
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["yOffset"] = -2,
							["position"] = "TOP",
						},
						["height"] = 50,
						["width"] = 122,
					},
					["pet"] = {
						["infoPanel"] = {
							["enable"] = true,
							["height"] = 14,
						},
						["debuffs"] = {
							["enable"] = true,
						},
						["threatStyle"] = "NONE",
						["castbar"] = {
							["width"] = 122,
						},
						["height"] = 50,
						["portrait"] = {
							["camDistanceScale"] = 2,
						},
						["width"] = 122,
					},
					["party"] = {
						["horizontalSpacing"] = 3,
						["debuffs"] = {
							["numrows"] = 4,
							["anchorPoint"] = "BOTTOM",
							["perrow"] = 1,
						},
						["power"] = {
							["text_format"] = "",
							["height"] = 5,
						},
						["enable"] = false,
						["rdebuffs"] = {
							["font"] = "Expressway",
						},
						["growthDirection"] = "RIGHT_DOWN",
						["infoPanel"] = {
							["enable"] = true,
						},
						["roleIcon"] = {
							["position"] = "TOPRIGHT",
						},
						["health"] = {
							["attachTextTo"] = "InfoPanel",
							["orientation"] = "VERTICAL",
							["text_format"] = "[healthcolor][health:current]",
							["position"] = "RIGHT",
						},
						["healPrediction"] = true,
						["height"] = 59,
						["verticalSpacing"] = 0,
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[namecolor][name:short]",
							["position"] = "LEFT",
						},
						["width"] = 110,
					},
					["player"] = {
						["infoPanel"] = {
							["enable"] = true,
						},
						["debuffs"] = {
							["perrow"] = 7,
						},
						["health"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[healthcolor][health:current-max]",
						},
						["power"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[powercolor][power:current-max]",
							["height"] = 15,
						},
						["height"] = 80,
						["castbar"] = {
							["iconAttached"] = false,
							["iconSize"] = 54,
							["height"] = 35,
							["width"] = 478,
						},
						["classbar"] = {
							["height"] = 15,
							["autoHide"] = true,
						},
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[namecolor][name]",
						},
					},
					["raid40"] = {
						["enable"] = false,
						["rdebuffs"] = {
							["font"] = "Expressway",
						},
					},
					["focus"] = {
						["infoPanel"] = {
							["height"] = 17,
							["enable"] = true,
						},
						["threatStyle"] = "NONE",
						["castbar"] = {
							["iconSize"] = 26,
							["width"] = 122,
						},
						["height"] = 56,
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["position"] = "LEFT",
						},
						["health"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[healthcolor][health:current]",
						},
						["width"] = 189,
					},
					["target"] = {
						["debuffs"] = {
							["perrow"] = 7,
						},
						["power"] = {
							["attachTextTo"] = "InfoPanel",
							["hideonnpc"] = false,
							["text_format"] = "[powercolor][power:current-max]",
							["height"] = 15,
						},
						["infoPanel"] = {
							["enable"] = true,
						},
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[namecolor][name]",
						},
						["castbar"] = {
							["iconSize"] = 54,
							["iconAttached"] = false,
						},
						["height"] = 80,
						["buffs"] = {
							["perrow"] = 7,
						},
						["smartAuraPosition"] = "DEBUFFS_ON_BUFFS",
						["health"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[healthcolor][health:current-max]",
						},
					},
					["raid"] = {
						["roleIcon"] = {
							["position"] = "RIGHT",
						},
						["debuffs"] = {
							["enable"] = true,
							["sizeOverride"] = 27,
							["perrow"] = 4,
						},
						["rdebuffs"] = {
							["enable"] = false,
							["font"] = "Expressway",
						},
						["growthDirection"] = "UP_RIGHT",
						["health"] = {
							["yOffset"] = -6,
						},
						["width"] = 140,
						["height"] = 28,
						["name"] = {
							["position"] = "LEFT",
						},
						["visibility"] = "[nogroup] hide;show",
						["groupsPerRowCol"] = 5,
					},
					["arena"] = {
						["castbar"] = {
							["width"] = 246,
						},
						["spacing"] = 26,
					},
					["assist"] = {
						["enable"] = false,
					},
				},
			},
			["datatexts"] = {
				["minimapPanels"] = false,
				["fontSize"] = 11,
				["leftChatPanel"] = false,
				["goldFormat"] = "SHORT",
				["panelTransparency"] = true,
				["font"] = "Expressway",
				["panels"] = {
					["BottomMiniPanel"] = "Time",
					["RightMiniPanel"] = "",
					["RightChatDataPanel"] = {
						["right"] = "",
						["left"] = "",
						["middle"] = "",
					},
					["LeftMiniPanel"] = "",
					["LeftChatDataPanel"] = {
						["right"] = "",
						["left"] = "",
						["middle"] = "",
					},
				},
				["rightChatPanel"] = false,
			},
			["actionbar"] = {
				["bar3"] = {
					["inheritGlobalFade"] = true,
					["buttonsize"] = 38,
					["buttonsPerRow"] = 3,
				},
				["fontSize"] = 9,
				["bar2"] = {
					["enabled"] = true,
					["inheritGlobalFade"] = true,
					["buttonsize"] = 38,
				},
				["bar1"] = {
					["heightMult"] = 2,
					["inheritGlobalFade"] = true,
					["buttonsize"] = 38,
				},
				["bar5"] = {
					["inheritGlobalFade"] = true,
					["buttonsize"] = 38,
					["buttonsPerRow"] = 3,
				},
				["globalFadeAlpha"] = 0.87,
				["stanceBar"] = {
					["inheritGlobalFade"] = true,
				},
				["bar6"] = {
					["buttonsize"] = 38,
				},
				["bar4"] = {
					["enabled"] = false,
					["backdrop"] = false,
					["buttonsize"] = 38,
				},
			},
			["layoutSet"] = "dpsMelee",
			["chat"] = {
				["chatHistory"] = false,
				["fontSize"] = 11,
				["tabFont"] = "Expressway",
				["tabFontSize"] = 11,
				["fadeUndockedTabs"] = false,
				["editBoxPosition"] = "ABOVE_CHAT",
				["fadeTabsNoBackdrop"] = false,
				["font"] = "Expressway",
				["panelBackdrop"] = "HIDEBOTH",
			},
			["tooltip"] = {
				["textFontSize"] = 11,
				["font"] = "Expressway",
				["healthBar"] = {
					["font"] = "Expressway",
				},
				["smallTextFontSize"] = 11,
				["fontSize"] = 11,
				["headerFontSize"] = 11,
			},
			["nameplates"] = {
				["filters"] = {
				},
			},
		},
		["Damage"] = {
			["databars"] = {
				["artifact"] = {
					["textFormat"] = "CURREM",
					["fontOutline"] = "OUTLINE",
					["orientation"] = "HORIZONTAL",
					["height"] = 9,
					["textSize"] = 10,
					["width"] = 412,
				},
				["experience"] = {
					["width"] = 350,
					["height"] = 10,
					["textSize"] = 12,
					["orientation"] = "HORIZONTAL",
				},
				["azerite"] = {
					["width"] = 222,
					["orientation"] = "HORIZONTAL",
					["height"] = 10,
				},
				["reputation"] = {
					["enable"] = true,
					["width"] = 222,
					["orientation"] = "HORIZONTAL",
					["height"] = 10,
				},
				["honor"] = {
					["textFormat"] = "CURREM",
					["width"] = 222,
					["height"] = 10,
					["fontOutline"] = "OUTLINE",
					["orientation"] = "HORIZONTAL",
					["textSize"] = 10,
				},
			},
			["currentTutorial"] = 2,
			["general"] = {
				["totems"] = {
					["spacing"] = 8,
					["enable"] = false,
					["size"] = 50,
					["growthDirection"] = "HORIZONTAL",
				},
				["interruptAnnounce"] = "SAY",
				["valuecolor"] = {
					["b"] = 0.45,
					["g"] = 0.83,
					["r"] = 0.67,
				},
				["loginmessage"] = false,
				["stickyFrames"] = false,
				["topPanel"] = false,
				["afk"] = false,
				["autoRepair"] = "PLAYER",
				["minimap"] = {
					["icons"] = {
						["classHall"] = {
							["xOffset"] = 39,
						},
					},
					["size"] = 220,
				},
				["objectiveFrameHeight"] = 400,
				["talkingHeadFrameScale"] = 1,
				["bonusObjectivePosition"] = "AUTO",
				["bordercolor"] = {
					["b"] = 0,
					["g"] = 0,
					["r"] = 0,
				},
			},
			["v11NamePlateReset"] = true,
			["hideTutorial"] = true,
			["chat"] = {
				["tapFontSize"] = 10,
				["panelWidth"] = 472,
				["fontSize"] = 10,
				["panelColorConverted"] = true,
				["panelHeight"] = 236,
				["panelWidthRight"] = 400,
				["panelBackdrop"] = "LEFT",
				["panelTabBackdrop"] = true,
			},
			["layoutSet"] = "tank",
			["thinBorderColorSet"] = true,
			["movers"] = {
				["ElvUF_PlayerCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,95",
				["ElvUF_RaidMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,248",
				["BossButton"] = "BOTTOM,ElvUIParent,BOTTOM,-1,293",
				["LootFrameMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,418,-186",
				["ZoneAbility"] = "BOTTOM,ElvUIParent,BOTTOM,-1,293",
				["SocialMenuMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-187",
				["ElvUF_RaidpetMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,737",
				["VehicleSeatMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-4",
				["ExperienceBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,43",
				["ElvUF_TargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,342,139",
				["LossControlMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,507",
				["LevelUpBossBannerMover"] = "TOP,ElvUIParent,TOP,-1,-120",
				["MirrorTimer1Mover"] = "TOP,ElvUIParent,TOP,-1,-96",
				["ElvAB_1"] = "BOTTOM,ElvUIParent,BOTTOM,-1,191",
				["ElvAB_2"] = "BOTTOM,ElvUIParent,BOTTOM,0,4",
				["BelowMinimapContainerMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-274",
				["TalkingHeadFrameMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,373",
				["AltPowerBarMover"] = "TOP,ElvUIParent,TOP,-1,-36",
				["ElvAB_3"] = "BOTTOM,ElvUIParent,BOTTOM,-1,139",
				["ReputationBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-246",
				["ObjectiveFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-163,-325",
				["BNETMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-274",
				["ShiftAB"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,769",
				["VOICECHAT"] = "TOPLEFT,ElvUIParent,TOPLEFT,368,-210",
				["HonorBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-255",
				["ElvUF_TargetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,243",
				["ElvUF_Raid40Mover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,482",
				["ElvUF_PetMover"] = "BOTTOM,ElvUIParent,BOTTOM,-342,100",
				["ElvUF_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,-342,139",
				["TotemBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,490,4",
				["AzeriteBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-245",
				["ElvUF_PartyMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,248",
				["AlertFrameMover"] = "TOP,ElvUIParent,TOP,-1,-18",
				["ElvUF_TargetTargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,342,100",
				["ElvAB_5"] = "BOTTOM,ElvUIParent,BOTTOM,-92,57",
			},
			["tooltip"] = {
				["fontSize"] = 10,
				["healthBar"] = {
					["font"] = "PT Sans Narrow",
					["fontOutline"] = "MONOCHROMEOUTLINE",
					["height"] = 12,
				},
			},
			["unitframe"] = {
				["smoothbars"] = true,
				["units"] = {
					["targettargettarget"] = {
						["health"] = {
							["frequentUpdates"] = true,
						},
					},
					["pet"] = {
						["debuffs"] = {
							["anchorPoint"] = "TOPRIGHT",
							["enable"] = true,
						},
						["disableTargetGlow"] = false,
						["portrait"] = {
							["camDistanceScale"] = 2,
						},
						["width"] = 270,
						["infoPanel"] = {
							["height"] = 14,
						},
						["health"] = {
							["frequentUpdates"] = true,
						},
						["castbar"] = {
							["width"] = 270,
							["iconSize"] = 32,
						},
					},
					["focustarget"] = {
						["health"] = {
							["frequentUpdates"] = true,
						},
					},
					["pettarget"] = {
						["health"] = {
							["frequentUpdates"] = true,
						},
					},
					["targettarget"] = {
						["debuffs"] = {
							["anchorPoint"] = "TOPRIGHT",
							["enable"] = false,
						},
						["threatStyle"] = "GLOW",
						["power"] = {
							["enable"] = false,
						},
						["disableMouseoverGlow"] = true,
						["width"] = 270,
						["health"] = {
							["frequentUpdates"] = true,
						},
						["raidicon"] = {
							["attachTo"] = "LEFT",
							["xOffset"] = 2,
							["enable"] = false,
							["yOffset"] = 0,
						},
					},
					["arena"] = {
						["health"] = {
							["frequentUpdates"] = true,
						},
						["castbar"] = {
							["height"] = 4.00001096725464,
							["width"] = 196.001281738281,
						},
					},
					["boss"] = {
						["health"] = {
							["frequentUpdates"] = true,
						},
						["castbar"] = {
							["height"] = 4.00005483627319,
							["width"] = 213.33464050293,
						},
					},
					["raid40"] = {
						["enable"] = false,
						["rdebuffs"] = {
							["font"] = "PT Sans Narrow",
						},
					},
					["focus"] = {
						["health"] = {
							["frequentUpdates"] = true,
						},
						["castbar"] = {
							["height"] = 4.00003290176392,
							["width"] = 186.667816162109,
						},
					},
					["target"] = {
						["debuffs"] = {
							["anchorPoint"] = "TOPLEFT",
							["perrow"] = 7,
							["attachTo"] = "FRAME",
							["enable"] = false,
						},
						["orientation"] = "LEFT",
						["aurabar"] = {
							["height"] = 26,
						},
						["castbar"] = {
							["insideInfoPanel"] = false,
							["width"] = 405,
							["height"] = 40,
						},
						["healPrediction"] = {
							["showOverAbsorbs"] = false,
						},
						["disableMouseoverGlow"] = true,
						["infoPanel"] = {
							["enable"] = true,
						},
						["health"] = {
							["attachTextTo"] = "InfoPanel",
							["frequentUpdates"] = true,
						},
						["power"] = {
							["attachTextTo"] = "InfoPanel",
							["height"] = 22,
						},
						["height"] = 82,
						["buffs"] = {
							["anchorPoint"] = "TOPLEFT",
							["perrow"] = 7,
						},
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[namecolor][name]",
						},
					},
					["raid"] = {
						["debuffs"] = {
							["sizeOverride"] = 16,
							["noDuration"] = true,
						},
						["infoPanel"] = {
							["enable"] = true,
						},
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["position"] = "BOTTOMLEFT",
							["xOffset"] = 2,
						},
						["buffs"] = {
							["sizeOverride"] = 22,
							["useBlacklist"] = false,
							["noDuration"] = false,
							["playerOnly"] = false,
							["useFilter"] = "TurtleBuffs",
						},
						["visibility"] = "[@raid6,noexists] hide;show",
						["rdebuffs"] = {
							["xOffset"] = 30,
							["yOffset"] = 25,
							["font"] = "PT Sans Narrow",
							["size"] = 30,
						},
						["growthDirection"] = "RIGHT_UP",
						["resurrectIcon"] = {
							["attachTo"] = "BOTTOMRIGHT",
						},
						["roleIcon"] = {
							["attachTo"] = "InfoPanel",
							["position"] = "BOTTOMRIGHT",
							["xOffset"] = 0,
							["size"] = 12,
						},
						["raidWideSorting"] = false,
						["width"] = 92,
						["health"] = {
							["frequentUpdates"] = true,
						},
						["numGroups"] = 8,
					},
					["party"] = {
						["height"] = 74,
						["buffs"] = {
							["sizeOverride"] = 22,
							["useBlacklist"] = false,
							["noDuration"] = false,
							["playerOnly"] = false,
							["useFilter"] = "TurtleBuffs",
						},
						["rdebuffs"] = {
							["font"] = "PT Sans Narrow",
						},
						["power"] = {
							["height"] = 13,
						},
						["width"] = 231,
					},
					["player"] = {
						["debuffs"] = {
							["perrow"] = 7,
						},
						["classbar"] = {
							["height"] = 14,
						},
						["aurabar"] = {
							["height"] = 26,
						},
						["power"] = {
							["height"] = 22,
							["attachTextTo"] = "InfoPanel",
						},
						["healPrediction"] = {
							["showOverAbsorbs"] = false,
						},
						["disableMouseoverGlow"] = true,
						["infoPanel"] = {
							["enable"] = true,
						},
						["health"] = {
							["attachTextTo"] = "InfoPanel",
							["frequentUpdates"] = true,
						},
						["height"] = 82,
						["buffs"] = {
							["perrow"] = 7,
						},
						["castbar"] = {
							["insideInfoPanel"] = false,
							["width"] = 405,
							["height"] = 40,
						},
					},
				},
				["colors"] = {
					["healthclass"] = true,
					["castClassColor"] = true,
					["auraBarBuff"] = {
						["b"] = 0.41,
						["g"] = 0.96,
						["r"] = 1,
					},
				},
				["fontOutline"] = "OUTLINE",
				["thinBorders"] = true,
			},
			["datatexts"] = {
				["panels"] = {
					["LeftMiniPanel"] = "Time",
					["LeftChatDataPanel"] = {
						["right"] = "O Item Level",
						["left"] = "System",
					},
					["BottomMiniPanel"] = "Bags",
					["RightMiniPanel"] = "Currencies",
				},
				["rightChatPanel"] = false,
			},
			["actionbar"] = {
				["bar3"] = {
					["buttonspacing"] = 1,
					["buttons"] = 8,
					["showGrid"] = false,
					["buttonsPerRow"] = 10,
					["buttonsize"] = 50,
					["visibility"] = "[petbattle] hide; show",
				},
				["bar1"] = {
					["buttonspacing"] = 1,
					["buttons"] = 8,
					["buttonsPerRow"] = 10,
					["buttonsize"] = 50,
				},
				["font"] = "PT Sans Narrow",
				["backdropSpacingConverted"] = true,
				["globalFadeAlpha"] = 1,
				["bar2"] = {
					["buttonspacing"] = 1,
					["enabled"] = true,
					["buttons"] = 9,
					["showGrid"] = false,
					["buttonsPerRow"] = 10,
					["buttonsize"] = 38,
					["visibility"] = "[petbattle] hide; show",
				},
				["bar6"] = {
					["enabled"] = true,
					["mouseover"] = true,
					["showGrid"] = false,
					["visibility"] = "[petbattle] hide; show",
				},
				["bar5"] = {
					["enabled"] = false,
					["buttons"] = 9,
					["showGrid"] = false,
					["buttonsPerRow"] = 9,
					["buttonsize"] = 30,
					["visibility"] = "[petbattle] hide; show",
				},
				["bar4"] = {
					["enabled"] = false,
					["buttons"] = 9,
					["point"] = "BOTTOMLEFT",
					["backdrop"] = false,
					["showGrid"] = false,
					["buttonsPerRow"] = 9,
					["buttonsize"] = 30,
					["visibility"] = "[petbattle] hide; show",
				},
			},
			["bags"] = {
				["itemLevelFont"] = "PT Sans Narrow",
				["bagSize"] = 42,
				["itemLevelCustomColorEnable"] = true,
				["bankSize"] = 42,
				["countFontSize"] = 12,
				["itemLevelFontSize"] = 12,
				["bagWidth"] = 474,
				["scrapIcon"] = true,
				["countFont"] = "PT Sans Narrow",
				["vendorGrays"] = {
					["enable"] = true,
				},
				["bankWidth"] = 474,
			},
			["auras"] = {
				["debuffs"] = {
					["countFontSize"] = 10,
					["durationFontSize"] = 12,
					["size"] = 40,
				},
				["font"] = "PT Sans Narrow",
				["fontOutline"] = "NONE",
				["buffs"] = {
					["countFontSize"] = 10,
					["durationFontSize"] = 12,
					["size"] = 40,
				},
			},
		},
		["Zombear - Skeram"] = {
			["currentTutorial"] = 1,
			["hideTutorial"] = true,
			["movers"] = {
				["ElvUF_Raid40Mover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,432",
				["ShiftAB"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,1196",
				["ElvUF_PartyMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,196",
				["ElvUF_RaidMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,428",
				["ElvUF_RaidpetMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,737",
			},
			["v11NamePlateReset"] = true,
			["chat"] = {
				["panelColorConverted"] = true,
			},
		},
		["Falcorne - Skeram"] = {
			["databars"] = {
				["reputation"] = {
					["enable"] = true,
					["width"] = 222,
					["height"] = 10,
					["orientation"] = "HORIZONTAL",
				},
				["azerite"] = {
					["width"] = 222,
					["orientation"] = "HORIZONTAL",
					["height"] = 10,
				},
				["experience"] = {
					["width"] = 350,
					["height"] = 10,
					["textSize"] = 12,
					["orientation"] = "HORIZONTAL",
				},
				["honor"] = {
					["width"] = 222,
					["height"] = 10,
					["orientation"] = "HORIZONTAL",
				},
			},
			["currentTutorial"] = 1,
			["general"] = {
				["valuecolor"] = {
					["r"] = 0.67,
					["g"] = 0.83,
					["b"] = 0.45,
				},
				["bordercolor"] = {
					["r"] = 0,
					["g"] = 0,
					["b"] = 0,
				},
				["minimap"] = {
					["size"] = 220,
				},
				["objectiveFrameHeight"] = 400,
				["talkingHeadFrameScale"] = 1,
				["totems"] = {
					["spacing"] = 8,
					["size"] = 50,
					["growthDirection"] = "HORIZONTAL",
				},
				["bonusObjectivePosition"] = "AUTO",
			},
			["v11NamePlateReset"] = true,
			["hideTutorial"] = true,
			["auras"] = {
				["debuffs"] = {
					["countFontSize"] = 10,
					["size"] = 40,
				},
				["buffs"] = {
					["countFontSize"] = 10,
					["size"] = 40,
				},
			},
			["layoutSet"] = "dpsCaster",
			["movers"] = {
				["ElvUF_PlayerCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,243",
				["ElvUF_RaidMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,248",
				["BossButton"] = "BOTTOM,ElvUIParent,BOTTOM,-1,293",
				["LootFrameMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,418,-186",
				["ZoneAbility"] = "BOTTOM,ElvUIParent,BOTTOM,-1,293",
				["SocialMenuMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-187",
				["ElvUF_RaidpetMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,737",
				["VehicleSeatMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-4",
				["ExperienceBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,43",
				["ElvUF_TargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,342,139",
				["LossControlMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,507",
				["LevelUpBossBannerMover"] = "TOP,ElvUIParent,TOP,-1,-120",
				["MirrorTimer1Mover"] = "TOP,ElvUIParent,TOP,-1,-96",
				["ElvAB_1"] = "BOTTOM,ElvUIParent,BOTTOM,-1,191",
				["ElvAB_2"] = "BOTTOM,ElvUIParent,BOTTOM,0,4",
				["BelowMinimapContainerMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-274",
				["TalkingHeadFrameMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,373",
				["AltPowerBarMover"] = "TOP,ElvUIParent,TOP,-1,-36",
				["ElvAB_3"] = "BOTTOM,ElvUIParent,BOTTOM,-1,139",
				["ReputationBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-246",
				["ObjectiveFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-163,-325",
				["BNETMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-274",
				["ShiftAB"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,769",
				["ElvUF_PetMover"] = "BOTTOM,ElvUIParent,BOTTOM,-342,100",
				["HonorBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-255",
				["ElvUF_TargetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,97",
				["ElvAB_5"] = "BOTTOM,ElvUIParent,BOTTOM,-92,57",
				["ElvUF_TargetTargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,342,100",
				["ElvUF_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,-342,139",
				["TotemBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,490,4",
				["AzeriteBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-245",
				["ElvUF_PartyMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,248",
				["AlertFrameMover"] = "TOP,ElvUIParent,TOP,-1,-18",
				["ElvUF_Raid40Mover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,482",
				["VOICECHAT"] = "TOPLEFT,ElvUIParent,TOPLEFT,368,-210",
			},
			["tooltip"] = {
				["fontSize"] = 10,
				["healthBar"] = {
					["fontOutline"] = "MONOCHROMEOUTLINE",
					["height"] = 12,
				},
			},
			["unitframe"] = {
				["units"] = {
					["pet"] = {
						["debuffs"] = {
							["anchorPoint"] = "TOPRIGHT",
							["enable"] = true,
						},
						["portrait"] = {
							["camDistanceScale"] = 2,
						},
						["width"] = 270,
						["infoPanel"] = {
							["height"] = 14,
						},
						["disableTargetGlow"] = false,
						["castbar"] = {
							["width"] = 270,
							["iconSize"] = 32,
						},
					},
					["player"] = {
						["classbar"] = {
							["height"] = 14,
						},
						["power"] = {
							["height"] = 22,
							["attachTextTo"] = "InfoPanel",
						},
						["healPrediction"] = {
							["showOverAbsorbs"] = false,
						},
						["disableMouseoverGlow"] = true,
						["health"] = {
							["attachTextTo"] = "InfoPanel",
						},
						["castbar"] = {
							["insideInfoPanel"] = false,
							["width"] = 405,
							["height"] = 40,
						},
						["height"] = 82,
						["infoPanel"] = {
							["enable"] = true,
						},
					},
					["raid40"] = {
						["enable"] = false,
						["rdebuffs"] = {
							["font"] = "PT Sans Narrow",
						},
					},
					["target"] = {
						["height"] = 82,
						["castbar"] = {
							["insideInfoPanel"] = false,
							["width"] = 405,
							["height"] = 40,
						},
						["power"] = {
							["attachTextTo"] = "InfoPanel",
							["height"] = 22,
						},
						["healPrediction"] = {
							["showOverAbsorbs"] = false,
						},
						["disableMouseoverGlow"] = true,
						["infoPanel"] = {
							["enable"] = true,
						},
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[namecolor][name]",
						},
						["orientation"] = "LEFT",
						["health"] = {
							["attachTextTo"] = "InfoPanel",
						},
					},
					["raid"] = {
						["infoPanel"] = {
							["enable"] = true,
						},
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["position"] = "BOTTOMLEFT",
							["xOffset"] = 2,
						},
						["visibility"] = "[@raid6,noexists] hide;show",
						["rdebuffs"] = {
							["xOffset"] = 30,
							["yOffset"] = 25,
							["font"] = "PT Sans Narrow",
							["size"] = 30,
						},
						["growthDirection"] = "RIGHT_UP",
						["resurrectIcon"] = {
							["attachTo"] = "BOTTOMRIGHT",
						},
						["numGroups"] = 8,
						["width"] = 92,
						["health"] = {
							["frequentUpdates"] = true,
						},
						["roleIcon"] = {
							["attachTo"] = "InfoPanel",
							["position"] = "BOTTOMRIGHT",
							["xOffset"] = 0,
							["size"] = 12,
						},
					},
					["party"] = {
						["height"] = 74,
						["rdebuffs"] = {
							["font"] = "PT Sans Narrow",
						},
						["power"] = {
							["height"] = 13,
						},
						["width"] = 231,
					},
					["targettarget"] = {
						["debuffs"] = {
							["anchorPoint"] = "TOPRIGHT",
							["enable"] = false,
						},
						["threatStyle"] = "GLOW",
						["power"] = {
							["enable"] = false,
						},
						["disableMouseoverGlow"] = true,
						["width"] = 270,
						["raidicon"] = {
							["attachTo"] = "LEFT",
							["xOffset"] = 2,
							["enable"] = false,
							["yOffset"] = 0,
						},
					},
				},
				["colors"] = {
					["healthclass"] = true,
					["castClassColor"] = true,
					["auraBarBuff"] = {
						["r"] = 0.67,
						["g"] = 0.83,
						["b"] = 0.45,
					},
				},
				["smoothbars"] = true,
				["thinBorders"] = true,
			},
			["actionbar"] = {
				["bar3"] = {
					["buttonspacing"] = 1,
					["buttons"] = 8,
					["buttonsPerRow"] = 10,
					["buttonsize"] = 50,
				},
				["bar1"] = {
					["buttonspacing"] = 1,
					["buttons"] = 8,
					["buttonsize"] = 50,
				},
				["backdropSpacingConverted"] = true,
				["bar2"] = {
					["buttonspacing"] = 1,
					["enabled"] = true,
					["buttons"] = 9,
					["buttonsize"] = 38,
				},
				["bar5"] = {
					["enabled"] = false,
				},
				["bar4"] = {
					["enabled"] = false,
				},
			},
			["bags"] = {
				["bagSize"] = 42,
				["itemLevelCustomColorEnable"] = true,
				["bankSize"] = 42,
				["scrapIcon"] = true,
				["bagWidth"] = 474,
				["bankWidth"] = 474,
			},
			["chat"] = {
				["tapFontSize"] = 10,
				["panelWidth"] = 472,
				["fontSize"] = 10,
				["panelColorConverted"] = true,
				["panelHeight"] = 236,
			},
		},
		["Quizzel - Atiesh"] = {
			["databars"] = {
				["reputation"] = {
					["enable"] = true,
					["orientation"] = "HORIZONTAL",
					["height"] = 10,
					["width"] = 222,
				},
				["azerite"] = {
					["orientation"] = "HORIZONTAL",
					["height"] = 10,
					["width"] = 222,
				},
				["experience"] = {
					["height"] = 10,
					["orientation"] = "HORIZONTAL",
					["textSize"] = 12,
					["width"] = 350,
				},
				["honor"] = {
					["height"] = 10,
					["orientation"] = "HORIZONTAL",
					["width"] = 222,
				},
			},
			["currentTutorial"] = 1,
			["general"] = {
				["totems"] = {
					["spacing"] = 8,
					["size"] = 50,
					["growthDirection"] = "HORIZONTAL",
				},
				["bonusObjectivePosition"] = "AUTO",
				["valuecolor"] = {
					["r"] = 1,
					["g"] = 0.96,
					["b"] = 0.41,
				},
				["talkingHeadFrameScale"] = 1,
				["bordercolor"] = {
					["r"] = 0,
					["g"] = 0,
					["b"] = 0,
				},
				["objectiveFrameHeight"] = 400,
				["minimap"] = {
					["size"] = 220,
				},
			},
			["movers"] = {
				["ElvUF_PlayerCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,95",
				["ElvUF_RaidMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,248",
				["BossButton"] = "BOTTOM,ElvUIParent,BOTTOM,-1,293",
				["LootFrameMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,418,-186",
				["ZoneAbility"] = "BOTTOM,ElvUIParent,BOTTOM,-1,293",
				["SocialMenuMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-187",
				["ElvUF_RaidpetMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,737",
				["VehicleSeatMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-4",
				["ExperienceBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,43",
				["ElvUF_TargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,342,139",
				["LossControlMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,507",
				["LevelUpBossBannerMover"] = "TOP,ElvUIParent,TOP,-1,-120",
				["MirrorTimer1Mover"] = "TOP,ElvUIParent,TOP,-1,-96",
				["ElvAB_1"] = "BOTTOM,ElvUIParent,BOTTOM,-1,191",
				["ElvAB_2"] = "BOTTOM,ElvUIParent,BOTTOM,0,4",
				["BelowMinimapContainerMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-274",
				["TalkingHeadFrameMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,373",
				["AltPowerBarMover"] = "TOP,ElvUIParent,TOP,-1,-36",
				["ElvAB_3"] = "BOTTOM,ElvUIParent,BOTTOM,-1,139",
				["ReputationBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-246",
				["ObjectiveFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-163,-325",
				["BNETMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-274",
				["ShiftAB"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,769",
				["ElvAB_5"] = "BOTTOM,ElvUIParent,BOTTOM,-92,57",
				["HonorBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-255",
				["ElvUF_TargetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,243",
				["ElvUF_TargetTargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,342,100",
				["ElvUF_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,-342,139",
				["TotemBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,490,4",
				["ElvUF_PetMover"] = "BOTTOM,ElvUIParent,BOTTOM,-342,100",
				["AzeriteBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-245",
				["ElvUF_PartyMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,248",
				["AlertFrameMover"] = "TOP,ElvUIParent,TOP,-1,-18",
				["ElvUF_Raid40Mover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,482",
				["VOICECHAT"] = "TOPLEFT,ElvUIParent,TOPLEFT,368,-210",
			},
			["v11NamePlateReset"] = true,
			["hideTutorial"] = true,
			["auras"] = {
				["debuffs"] = {
					["countFontSize"] = 10,
					["size"] = 40,
				},
				["buffs"] = {
					["countFontSize"] = 10,
					["size"] = 40,
				},
			},
			["unitframe"] = {
				["colors"] = {
					["auraBarBuff"] = {
						["r"] = 1,
						["g"] = 0.96,
						["b"] = 0.41,
					},
					["castClassColor"] = true,
					["healthclass"] = true,
				},
				["smoothbars"] = true,
				["thinBorders"] = true,
				["units"] = {
					["player"] = {
						["infoPanel"] = {
							["enable"] = true,
						},
						["classbar"] = {
							["height"] = 14,
						},
						["health"] = {
							["attachTextTo"] = "InfoPanel",
						},
						["power"] = {
							["height"] = 22,
							["attachTextTo"] = "InfoPanel",
						},
						["height"] = 82,
						["healPrediction"] = {
							["showOverAbsorbs"] = false,
						},
						["disableMouseoverGlow"] = true,
						["castbar"] = {
							["height"] = 40,
							["insideInfoPanel"] = false,
							["width"] = 405,
						},
					},
					["raid40"] = {
						["enable"] = false,
						["rdebuffs"] = {
							["font"] = "PT Sans Narrow",
						},
					},
					["party"] = {
						["height"] = 74,
						["rdebuffs"] = {
							["font"] = "PT Sans Narrow",
						},
						["power"] = {
							["height"] = 13,
						},
						["width"] = 231,
					},
					["target"] = {
						["castbar"] = {
							["height"] = 40,
							["insideInfoPanel"] = false,
							["width"] = 405,
						},
						["healPrediction"] = {
							["showOverAbsorbs"] = false,
						},
						["disableMouseoverGlow"] = true,
						["infoPanel"] = {
							["enable"] = true,
						},
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[namecolor][name]",
						},
						["height"] = 82,
						["power"] = {
							["attachTextTo"] = "InfoPanel",
							["height"] = 22,
						},
						["orientation"] = "LEFT",
						["health"] = {
							["attachTextTo"] = "InfoPanel",
						},
					},
					["raid"] = {
						["roleIcon"] = {
							["attachTo"] = "InfoPanel",
							["position"] = "BOTTOMRIGHT",
							["xOffset"] = 0,
							["size"] = 12,
						},
						["rdebuffs"] = {
							["xOffset"] = 30,
							["font"] = "PT Sans Narrow",
							["yOffset"] = 25,
							["size"] = 30,
						},
						["numGroups"] = 8,
						["growthDirection"] = "RIGHT_UP",
						["infoPanel"] = {
							["enable"] = true,
						},
						["resurrectIcon"] = {
							["attachTo"] = "BOTTOMRIGHT",
						},
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["xOffset"] = 2,
							["position"] = "BOTTOMLEFT",
						},
						["width"] = 92,
						["visibility"] = "[@raid6,noexists] hide;show",
						["health"] = {
							["frequentUpdates"] = true,
						},
					},
					["pet"] = {
						["infoPanel"] = {
							["height"] = 14,
						},
						["debuffs"] = {
							["anchorPoint"] = "TOPRIGHT",
							["enable"] = true,
						},
						["portrait"] = {
							["camDistanceScale"] = 2,
						},
						["castbar"] = {
							["iconSize"] = 32,
							["width"] = 270,
						},
						["disableTargetGlow"] = false,
						["width"] = 270,
					},
					["targettarget"] = {
						["debuffs"] = {
							["anchorPoint"] = "TOPRIGHT",
							["enable"] = false,
						},
						["threatStyle"] = "GLOW",
						["power"] = {
							["enable"] = false,
						},
						["width"] = 270,
						["disableMouseoverGlow"] = true,
						["raidicon"] = {
							["attachTo"] = "LEFT",
							["xOffset"] = 2,
							["enable"] = false,
							["yOffset"] = 0,
						},
					},
				},
			},
			["actionbar"] = {
				["bar3"] = {
					["buttons"] = 8,
					["buttonspacing"] = 1,
					["buttonsPerRow"] = 10,
					["buttonsize"] = 50,
					["visibility"] = "[petbattle] hide; show",
				},
				["bar6"] = {
					["visibility"] = "[petbattle] hide; show",
				},
				["bar2"] = {
					["enabled"] = true,
					["buttons"] = 9,
					["buttonspacing"] = 1,
					["buttonsize"] = 38,
					["visibility"] = "[petbattle] hide; show",
				},
				["bar1"] = {
					["buttonspacing"] = 1,
					["buttonsize"] = 50,
					["buttons"] = 8,
				},
				["backdropSpacingConverted"] = true,
				["bar5"] = {
					["enabled"] = false,
					["visibility"] = "[petbattle] hide; show",
				},
				["bar4"] = {
					["enabled"] = false,
					["visibility"] = "[petbattle] hide; show",
				},
			},
			["layoutSet"] = "tank",
			["tooltip"] = {
				["healthBar"] = {
					["height"] = 12,
					["fontOutline"] = "MONOCHROMEOUTLINE",
				},
				["fontSize"] = 10,
			},
			["bags"] = {
				["bagSize"] = 42,
				["bankWidth"] = 474,
				["bankSize"] = 42,
				["itemLevelCustomColorEnable"] = true,
				["scrapIcon"] = true,
				["bagWidth"] = 474,
			},
			["chat"] = {
				["fontSize"] = 10,
				["panelHeight"] = 236,
				["panelColorConverted"] = true,
				["tapFontSize"] = 10,
				["panelWidth"] = 472,
			},
		},
		["Garlicbear - Skeram"] = {
			["currentTutorial"] = 2,
			["movers"] = {
				["ElvUF_Raid40Mover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,432",
				["ShiftAB"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,1196",
				["ElvUF_PartyMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,195",
				["ElvUF_RaidMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,427",
				["ElvUF_RaidpetMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,736",
			},
			["v11NamePlateReset"] = true,
			["hideTutorial"] = true,
			["chat"] = {
				["panelColorConverted"] = true,
			},
		},
	},
}
ElvPrivateDB = {
	["profileKeys"] = {
		["Zombear - Skeram"] = "Zombear - Skeram",
		["Falcorne - Skeram"] = "Falcorne - Skeram",
		["Quizzel - Atiesh"] = "Quizzel - Atiesh",
		["Garlicbear - Skeram"] = "Garlicbear - Skeram",
	},
	["profiles"] = {
		["Zombear - Skeram"] = {
			["theme"] = "class",
			["install_complete"] = "1.07",
		},
		["Falcorne - Skeram"] = {
			["theme"] = "class",
			["install_complete"] = "1.08",
		},
		["Quizzel - Atiesh"] = {
			["theme"] = "class",
			["install_complete"] = "1.07",
		},
		["Garlicbear - Skeram"] = {
			["skins"] = {
				["blizzard"] = {
					["dressingroom"] = false,
				},
			},
			["install_complete"] = "11.07",
		},
	},
}

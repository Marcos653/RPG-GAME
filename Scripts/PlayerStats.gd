extends Node

var savePath = "user://Stats.json"
var file = File.new()


var Stats = {
	Level = 1,
	CurrentHealth = 10,
	MaxHealth = 100,
	CurrentMana = 120,
	MaxMana = 120,
	CurrentExperience = 0,
	MaxExperience = 300,

	Attack = 20,
	Defense = 10,
	Speed = 30,
	MagicAttack = 10,
	MagicDefense = 5,
	Willpower = 20,
	Luck = 30,
	Accuracy = 15,
}

func _ready():
	LoadStats()

func savestats():
	file.open(savePath, file.WRITE)
	file.store_line(to_json(Stats))
	file.close()


func LoadStats():
	if file.file_exists(savePath):
		file.open(savePath,file.READ)
		var tmp_data = file.get_as_text()
		file.close()

		var savedstats = {}
		savedstats = parse_json(tmp_data)
		
		Stats.Level = savedstats["Level"]
		Stats.CurrentHealth = savedstats["CurrentHealth"]
		Stats.MaxHealth = savedstats["MaxHealth"]
		Stats.CurrentMana = savedstats["CurrentMana"]
		Stats.MaxMana = savedstats["MaxMana"]
		Stats.CurrentExperience = savedstats["CurrentExperience"]
		Stats.MaxExperience = savedstats["MaxExperience"]
		Stats.Attack = savedstats["Attack"]
		Stats.Defense = savedstats["Defense"]
		Stats.Speed = savedstats["Speed"]
		Stats.MagicAttack = savedstats["MagicAttack"]
		Stats.MagicDefense = savedstats["MagicDefense"]
		Stats.Willpower = savedstats["Willpower"]
		Stats.Luck = savedstats["Luck"]
		Stats.Accuracy = savedstats["Accuracy"]


#func Level_Up():
#	if Stats.CurrentExperience >= Stats.MaxExperience:
#		levelingup = true
#		if Stats.Level <= 10:
#			Stats.Level += 1
#			Stats.MaxHealth += 5
#			Stats.MaxMana += 10
#			Stats.MaxExperience += 50
#			Stats.CurrentExperience -= Stats.MaxExperience
#			Stats.CurrentHealth = Stats.MaxHealth
#
#			Stats.Attack += 3
#			Stats.Defense += 2
#			Stats.Speedt += 3
#			Stats.MagicAttack += 2
#			Stats.MagicDefense += 1
#			Stats.Willpower += 1
#			Stats.Luck += 2
#			Stats.Accuracy += 2
#			print(Stats)
#		elif Stats.Level <= 20 and Stats.Level > 10:
#			Stats.Level += 1
#			Stats.MaxHealth += 6
#			Stats.MaxMana += 10
#			Stats.CurrentExperience -= Stats.MaxExperience
#			Stats.MaxExperience += 100
#			Stats.CurrentHealth = Stats.MaxHealth
#
#			Stats.Attack += 3
#			Stats.Defense += 2
#			Stats.Speedt += 3
#			Stats.MagicAttack += 2
#			Stats.MagicDefense += 1
#			Stats.Willpower += 1
#			Stats.Luck += 2
#			Stats.Accuracy += 2
#
#		elif Stats.Level <= 30 and Stats.Level > 20:
#			Stats.Level += 1
#			Stats.MaxHealth += 7
#			Stats.MaxMana += 10
#			Stats.CurrentExperience -= Stats.MaxExperience
#			Stats.MaxExperience += 150
#			Stats.CurrentHealth = Stats.MaxHealth
#
#			Stats.Attack += 3
#			Stats.Defense += 2
#			Stats.Speedt += 3
#			Stats.MagicAttack += 2
#			Stats.MagicDefense += 1
#			Stats.Willpower += 1
#			Stats.Luck += 2
#			Stats.Accuracy += 2
#
#		elif Stats.Level <= 40 and Stats.Level > 30:
#			Stats.Level += 1
#			Stats.MaxHealth += 8
#			Stats.MaxMana += 10
#			Stats.CurrentExperience -= Stats.MaxExperience
#			Stats.MaxExperience += 200
#			Stats.CurrentHealth = Stats.MaxHealth
#
#			Stats.Attack += 3
#			Stats.Defense += 2
#			Stats.Speedt += 3
#			Stats.MagicAttack += 2
#			Stats.MagicDefense += 1
#			Stats.Willpower += 1
#			Stats.Luck += 2
#			Stats.Accuracy += 2
#
#		elif Stats.Level <= 50 and Stats.Level > 40:
#			Stats.Level += 1
#			Stats.MaxHealth += 9
#			Stats.MaxMana += 10
#			Stats.CurrentExperience -= Stats.MaxExperience
#			Stats.MaxExperience += 250
#			Stats.CurrentHealth = Stats.MaxHealth
#
#			Stats.Attack += 3
#			Stats.Defense += 2
#			Stats.Speedt += 3
#			Stats.MagicAttack += 2
#			Stats.MagicDefense += 1
#			Stats.Willpower += 1
#			Stats.Luck += 2
#			Stats.Accuracy += 2
#
#		elif Stats.Level > 50:
#			Stats.Level += 1
#			Stats.MaxHealth += 10
#			Stats.MaxMana += 10
#			Stats.CurrentExperience -= Stats.MaxExperience
#			Stats.MaxExperience += 300
#			Stats.CurrentHealth = Stats.MaxHealth
#
#			Stats.Attack += 3
#			Stats.Defense += 2
#			Stats.Speedt += 3
#			Stats.MagicAttack += 2
#			Stats.MagicDefense += 1
#			Stats.Willpower += 1
#			Stats.Luck += 2
#			Stats.Accuracy += 2
#
#func xp_check():
#	if Stats.CurrentExperience < 0:
#		Stats.CurrentExperience = 0


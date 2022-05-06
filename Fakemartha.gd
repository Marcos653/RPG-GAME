extends StaticBody2D

var direction:int = 0

var dialog = ["[color=yellow]Martha[/color] \n NO [color=aqua]Bat[/color] over there?"]

var comp_dialog = ["[color=yellow]Martha[/color] \n Thank you for helping me."]

var fakequest_given = false
var fakequest = "Fake News"
var quest_des = "I am fake martha"
var quest_comp = false

func _ready():
	self.add_to_group("NPC")

func _process(delta):
	$AnimatedSprite.frame = direction


func facedown():
	direction = 0
func faceup():
	direction = 1
func faceleft():
	direction = 2
func faceright():
	direction = 3

func Dialog_Start():
	if fakequest_given == false:
		ND.NPCDialog = dialog
		get_tree().call_group("GUI_Dialog", "reset")
		QM.Quests.ActiveQuests.append(fakequest)
		QM.Quests.QuestDescription.append(quest_des)
		get_tree().call_group("Quest", "add_quest")
		fakequest_given = true
	elif fakequest_given == true:
		if QM.FakeMarthaQuest == true:
			ND.NPCDialog = comp_dialog
			get_tree().call_group("GUI_Dialog", "reset")
			get_tree().call_group("Quest", "remove_quest", fakequest, quest_des)
	elif fakequest_given == true:
		if QM.FakeMarthaQuest == false:
			ND.NPCDialog = dialog
			get_tree().call_group("GUI_Dialog", "reset")


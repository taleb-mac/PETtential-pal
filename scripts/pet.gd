extends StaticBody2D


var cur_mood = 'happy'

var max_hunger = 10
var max_health = 10

var cur_hunger = 10
var cur_health = 10

var inc_hunger = 2
var inc_health = 2

var moods = {
	"hungry": ["I'm so hungry, can you feed me now?", "My stomach is growling", "I need some food, I'm starving"],
	"afraid": ["I'm so afraid, what's going to happen?", "I just can't shake this fear", "I wish I could be brave"],
	"tired": ["I'm so tired, I need a nap", "I can barely keep my eyes open", "I just want to sleep"],
	"sad": ["Why do I have to be so sad all the time?", "I just can't seem to shake this sadness", "I wish I could be happy again"],
	"angry": ["Why do you keep doing that?!", "I'm so angry right now", "I just can't take it anymore"],
	"bored": ["This is so boring, I need something to do", "Can we do something fun?", "I'm so bored I could scream"],
	"excited": ["I'm so excited for what's to come!", "This is going to be so much fun!", "I can't wait!"],
	"love": ["I love you so much!", "You're the best thing that's ever happened to me", "I just can't imagine my life without you"],
	"happy": ["Hey there! I'm feeling happy today!", "I just love spending time with you!", "This is the best day ever!"]
}

var after_eating = [
	"Yum! That was delicious!",
	"I feel so much better now!",
	"Thanks for feeding me!",
	"I'm so full! I think I'll take a nap.",
	"I love eating, it's one of my favorite things!",
	"That hit the spot!",
	"Food is the way to my heart!",
	"You're such a good caregiver!",
	"I feel so lucky to have you taking care of me!",
	"I could eat this every day and never get tired of it!"
	]

var after_playing = [
	"That was so much fun!",
	"I love playing with you!",
	"I feel so happy and energized!",
	"You're the best playmate ever!",
	"I can't wait to do it again!",
	"Playing is the best way to spend time with you!",
	"I love how we always have so much fun together!",
	"You always know how to make me smile!",
	"I feel so lucky to have you in my life!",
	"Playing with you is the highlight of my day!"
	]

func on_play():
	if not cur_mood in ["hungry", "tired"]:
		cur_health = min(cur_health + inc_health, max_health)
		cur_mood = moods.keys()[randi() % moods.keys().size()]
		return after_playing[randi() % after_playing.size()]
	return moods[cur_mood][randi() % moods[cur_mood].size()]

func on_feed():
	if not cur_mood in ["tired", "afraid", "sad"]:
		cur_hunger = min(cur_hunger + inc_hunger, max_hunger)
		cur_mood = moods.keys()[randi() % moods.keys().size()]
		return after_eating[randi() % after_eating.size()]
	return moods[cur_mood][randi() % moods[cur_mood].size()]

func on_chat():
	return moods[cur_mood][randi() % moods[cur_mood].size()]
	


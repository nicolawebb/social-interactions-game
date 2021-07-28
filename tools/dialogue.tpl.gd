extends ProximityGroup

onready var player = get_tree().root.get_node("Game/Player")
onready var menu = get_tree().root.get_node("Game/UI")

var emotion
var selection
var stages setget set_group1_stage_state

signal dialogue(emotion, selection, stages, name)

# Called when the node enters the scene tree for the first time.
func _ready():
    emotion = "neutral"
    stages = 0
    connect("dialogue", game, "get_dialogue")
   
func interaction_dialogue(answer = ""):
        
    var group = get_tree().get_root().get_node("Game/NPCs/ProximityGroup1")
    var npc_dialogue = []
    
    if typeof(answer) == TYPE_STRING:
        self.selection = 0
        self.stages = 0
        self.emotion = "happy"
    
    if typeof(answer) == TYPE_ARRAY:
        if answer[0] == "...":
            print("...")
            self.selection = 0
            self.stages = 0
            self.emotion = "neutral"
        else:
            self.emotion = answer[1]
            self.selection = answer[2]
            
        print("stage: ", stages)
        print("selection:", selection)
        print("emotion: ", emotion)
    match stages:
      {%- set twototoo = [] -%}
      {% for character, content in characters.items() -%}
      {% if character == 'npc 2' -%}
        {% for stages in content -%}
          {% for selection in content[stages] -%}
            {%- set emotions = content[stages][selection] -%}
            {% for emotion, dialogues in emotions.items() -%}
                {%- set _ = twototoo.append((stages,selection,emotion,dialogues)) -%}
            {%- endfor %}
          {%- endfor %}
        {%- endfor %}
        {%- endif %}
      {%- endfor %}
      {% for character, content in characters.items() -%}
        {% if character == 'npc 1' -%}
          {% for stages in content %}
            {{ stages-1 }}:
              match selection:
            {% for selection in content[stages] %}
                {{selection}}:
                {%- set emotions = content[stages][selection] %}
                  match emotion:
                {% for emotion, dialogues in emotions.items() %}
                    "{{emotion}}":
                        npc_dialogue.append("{{dialogues[0]}}")
                      {%- for i in twototoo -%}
                      {%- if i[0] == stages and i[1] == selection and i[2] == emotion -%}
                      {%- set npc2dialogue = i[3] %}
                        npc_dialogue.append("{{npc2dialogue[0]}}")
                      {%- endif %}
                      {%- endfor %}
                        dialogue(group, npc_dialogue, emotion, selection, stages)
                        playerInput{{emotion, selection, stages-1}}
                        self.stages = {{stages}}
                {%- endfor %}
              {%- endfor %}
            {%- endfor %}
            {%- endif %}
          {%- endfor %}


    var player_answer = yield(player, "spoke")
    interaction_dialogue(player_answer)

func set_group1_stage_state(state):
    stages = state
    return stages
    
func dialogue(group, npc_dialogue, emotion, selection, stages):
    var npc_group = []
    var npcs = []
    var count = 0
    npc_group.append(group.get_children())
    for i in npc_group:
        for npc in i:
        	npc.set_expression(emotion)
            npcs.append(npc)
    if len(npcs) > 1:
        while count < npc_dialogue.size():
            for npc in npcs:
                if count < npc_dialogue.size():
                    npc.say(npc_dialogue[count], 4, true)
                    count += 1
                else:
                    continue
    else:
        for npc in npcs:
            for i in npc_dialogue:
                npc.say(i, 1, true)
                
func playerInput(mood, convo, dialogue):
    menu.setupOptions(mood, convo, dialogue)

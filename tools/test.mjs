graph TD


start --> 0npc1[Umm...]
start --> 0npc2[Blabla]

0npc1 --> 0p_1[Hello?]
0npc1 --> 0p_2[I hate you]

0p_2 --"angry"--> 1npc1_angry[Me too]
0p_2 -- "happy/neutral" --> 1npc1_happy[I beg your pardon]

1npc1_angry --> 1p_1[Bye]
1npc1_happy --> 1p_2[Sorry]
1npc1_angry --> 1p_2
1npc1_happy --> 1p_1

classDef player fill:#f96,stroke:#333,stroke-width:4px;
class 0p_2,0p_1,1p_1,1p_2 player


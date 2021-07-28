graph TD


start --> 0npc1[Umm...]
start --> 0npc2[Hello?]

0npc1 --> 0p_1[Good evening]
0npc1 --> 0p_2[Hello]
0npc1 --> 0p_3[...]

0p_1 --"angry"--> 1npc1_0_angry[What?]
0p_1 --"angry"--> 1npc1_0_angry[What do you want?]
0p_1  -- "happy/neutral" --> 1npc1_0_happy[Can we help you?]
0p_2 --"angry"--> 1npc1_0_angry[What do you want?]
0p_2 --"angry"--> 1npc2_0_angry[Yeah spit it out]
0p_2 -- "happy/neutral" --> 1npc1_0_happy[WHuh?]


1npc1_0_angry --> 1p_1[I have a few questions to ask]
1npc1_0_angry --> 1p_2[You're gonna answer some questions for me]
1npc1_0_angry --> 1p_3[...]
1npc1_0_happy --> 1p_4[Do you have a moment to talk?]
1npc1_0_happy --> 1p_5[I need a moment of your time]
1npc1_0_happy --> 1p_3


1p_1 --"angry"--> 2npc1_1_angry[Whatever]
1p_1 --"angry"--> 2npc2_1_angry[We'll talk to you I guess]
1p_1 -- "happy/neutral" --> 2npc1_1_happy[Okay]
1p_1 -- "happy/neutral" --> 2npc2_1_happy[What do you wanna know?]

1p_2 --"angry"--> 2npc1_2_angry[Jeez, pushy]
1p_2 --"angry"--> 2npc2_2_angry[What do you wanna know?]
1p_2 -- "happy/neutral" --> 2npc1_2_happy[Sure, what do you want?]

1p_4 --"angry"--> 2npc1_4_angry[Maybe]
1p_4 --"angry"--> 2npc2_4_angry[I guess we do]
1p_4 -- "happy/neutral" --> 2npc1_4_happy[We have a bit of time]
1p_4 -- "happy/neutral" --> 2npc2_4_happy[Yeah, go on...] 

1p_5 --"angry"--> 2npc1_5_angry[I suppose so]
1p_5 --"angry"--> 2npc2_5_angry[What's up?]
1p_5 -- "happy/neutral" --> 2npc1_5_happy[Sure, I guess]
1p_5 -- "happy/neutral" --> 2npc2_5_happy[What do you want from us?]


2npc1_1_angry --> 2p_1[Where where you last night?]
2npc1_1_angry --> 2p_2[Did you see anything?]
2npc1_1_angry --> 2p_3[...]
2npc1_1_happy --> 2p_4[Where were you last night?]
2npc1_1_happy --> 2p_5[What were you up to yesterday?]
2npc1_1_happy --> 2p_3

2npc1_2_angry --> 2p_1
2npc1_2_angry --> 2p_2
2npc1_2_angry --> 2p_3
2npc1_2_happy --> 2p_4
2npc1_2_happy --> 2p_5
2npc1_2_happy --> 2p_3

2npc1_4_angry --> 2p_1
2npc1_4_angry --> 2p_2
2npc1_4_angry --> 2p_3
2npc1_4_happy --> 2p_5
2npc1_4_happy --> 2p_3

2npc1_5_angry --> 2p_1
2npc1_5_angry --> 2p_3
2npc1_5_happy --> 2p_2
2npc1_5_happy --> 2p_5
2npc1_5_happy --> 2p_3

2p_1 --"angry"--> 3npc1_1_angry[We hung out]
2p_1 --"angry"--> 3npc2_1_angry[Yeah, Sarah was there too]
2p_1 -- "happy/neutral" --> 3npc1_1_happy[We met up with Sarah]
2p_1 -- "happy/neutral" --> 3npc2_1_happy[At the campfire]

2p_2 --"angry"--> 3npc1_2_angry[No.]
2p_2 -- "happy/neutral" --> 3npc1_2_happy[No, we didn't see anything]

2p_4 --"angry"--> 3npc1_4_angry[We were at the campfire]
2p_4 --"angry"--> 3npc2_4_angry[Sarah was there too]
2p_4 -- "happy/neutral" --> 3npc1_4_happy[We hung out at the campfire]
2p_4 -- "happy/neutral" --> 3npc2_4_happy[Sarah was with us too]

2p_5 --"angry"--> 3npc1_5_angry[Nothing sus.]
2p_5 -- "happy/neutral" --> 3npc1_5_happy[We hung out at the campfire]


3npc1_1_angry --> 3p_1[When was the last time you saw the mayor?]
3npc1_1_angry --> 3p_2[You see the mayor at all yesterday?]
3npc1_1_angry --> 3p_3[...]
3npc1_1_happy --> 3p_4[When was the last time you saw the mayor?]
3npc1_1_happy --> 3p_5[You see the mayor at all yesterday?]
3npc1_1_happy --> 3p_3

3npc1_2_angry --> 3p_1
3npc1_2_angry --> 3p_2
3npc1_2_angry --> 3p_3
3npc1_2_happy --> 3p_4
3npc1_2_happy --> 3p_5
3npc1_2_happy --> 3p_3

3npc1_4_angry --> 3p_1
3npc1_4_angry --> 3p_2
3npc1_4_angry --> 3p_3
3npc1_4_happy --> 3p_4
3npc1_4_happy --> 3p_5
3npc1_4_happy --> 3p_3

3npc1_5_angry --> 3p_1
3npc1_5_angry --> 3p_2
3npc1_5_angry --> 3p_3
3npc1_5_happy --> 3p_4
3npc1_5_happy --> 3p_5
3npc1_5_happy --> 3p_3


3p_1 --"angry"--> 4npc1_1_angry[About a week ago maybe?]
3p_1 --"angry"-->4npc2_1_angry[Yeah, it's been a while]
3p_1 -- "happy/neutral" --> 4npc1_1_happy[Sometime last week I think]
3p_1 -- "happy/neutral" --> 4npc2_1_happy[Yeah that sounds right]

3p_2 --"angry"--> 4npc1_2_angry[I didn't]
3p_1 --"angry"--> 4npc2_1_angry[Same here]
3p_2 -- "happy/neutral" --> 4npc1_2_happy[No I don't think so]
3p_2 -- "happy/neutral" --> 4npc2_2_happy[Yeah I didn't see him]

3p_4 --"angry"--> 4npc1_4_angry[About a week ago maybe?]
3p_4 --"angry"--> 4npc2_4_angry[Yeah, it's been a while]
3p_4 -- "happy/neutral" --> 4npc1_4_happy[Sometime last week I think]
3p_4 -- "happy/neutral" --> 4npc2_4_happy[Yeah that sounds right]

3p_5 --"angry"--> 4npc1_5_angry[I didn't see him]
3p_5 --"angry"--> 4npc2_5_angry[Same here]
3p_5 -- "happy/neutral" --> 4npc1_5_happy[No I don't think so]
3p_5 -- "happy/neutral" --> 4npc1_5_happy[Yeah I didn't see him]


4npc1_1_angry --> 4p_1[Did he have any enemies?]
4npc1_1_angry --> 4p_2[So who did he piss off?]
4npc1_1_angry --> 4p_3[...]
4npc1_1_happy --> 4p_4[Did anyone not like him? The mayor?]
4npc1_1_happy --> 4p_5[So who did he piss off?]
4npc1_1_happy --> 4p_3

4npc1_2_angry --> 4p_1
4npc1_2_angry --> 4p_2
4npc1_2_angry --> 4p_3
4npc1_2_happy --> 4p_4
4npc1_2_happy --> 4p_5
4npc1_2_happy --> 4p_3

4npc1_4_angry --> 4p_1
4npc1_4_angry --> 4p_2
4npc1_4_angry --> 4p_3
4npc1_4_happy --> 4p_4
4npc1_4_happy --> 4p_5
4npc1_4_happy --> 4p_3

4npc1_5_angry --> 4p_1
4npc1_5_angry --> 4p_2
4npc1_5_angry --> 4p_3
4npc1_5_happy --> 4p_4
4npc1_5_happy --> 4p_5
4npc1_5_happy --> 4p_3

4p_1 --"angry"--> 5npc1_1_angry[I don't know, Sarah I guess?]
4p_1 --"angry"--> 5npc2_1_angry[They always talked bad of each other]
4p_1 -- "happy/neutral" --> 5npc1_1_happy[Not really?]
4p_1 -- "happy/neutral" --> 5npc2_1_happy[I guess Sarah or Chris...]

4p_2 --"angry"--> 5npc1_2_angry[How am I supposed to know?]
4p_2 --"angry"--> 5npc2_2_angry[I guess Sarah or Chris?]
4p_2 -- "happy/neutral" --> 5npc1_2_happy[He butted heads with Chris a lot]
4p_2 -- "happy/neutral" --> 5npc2_2_happy[Same with Sarah]

4p_4 --"angry"--> 5npc1_4_angry[I know Chris didn't]
4p_4 --"angry"--> 5npc2_4_angry[Sarah too]
4p_4 -- "happy/neutral" --> 5npc1_4_happy[Not really?]
4p_4 -- "happy/neutral" --> 5npc2_4_happy[I guess Sarah or Chris...]

4p_5 --"angry"--> 5npc1_5_angry[How am I supposed to know?]
4p_5 --"angry"--> 5npc2_5_angry[I guess Sarah or Chris?]
4p_5 -- "happy/neutral" --> 5npc1_5_happy[He butted heads with Chris a lot]
4p_5 -- "happy/neutral" --> 5npc2_5_happy[Same with Sarah]

5npc1_1_angry --> 5p_1[Alright thank you, bye]
5npc1_1_angry --> 5p_2[Thanks]
5npc1_1_angry --> 5p_3[...]
5npc1_1_happy --> 5p_4[You've been a big help]
5npc1_1_happy --> 5p_5[Thank you guys, see you around]
5npc1_1_happy --> 5p_3

5npc1_2_angry --> 5p_1
5npc1_2_angry --> 5p_2
5npc1_2_angry --> 5p_3
5npc1_2_happy --> 5p_4
5npc1_2_happy --> 5p_5
5npc1_2_happy --> 5p_3

5npc1_4_angry --> 5p_1
5npc1_4_angry --> 5p_2
5npc1_4_angry --> 5p_3
5npc1_4_happy --> 5p_4
5npc1_4_happy --> 5p_5
5npc1_4_happy --> 5p_3

5npc1_5_angry --> 5p_1
5npc1_5_angry --> 5p_2
5npc1_5_angry --> 5p_3
5npc1_5_happy --> 5p_4
5npc1_5_happy --> 5p_5
5npc1_5_happy --> 5p_3


5p_1 --"angry"--> 6npc1_1_angry[Bye]
5p_1 --"angry"--> 6npc2_1_angry[...]
5p_1 -- "happy/neutral" --> 6npc1_1_happy[Good luck...]
5p_1 -- "happy/neutral" --> 6npc2_1_happy[Yeah, have fun]

5p_2 --"angry"--> 6npc1_2_angry[Alright, see ya]
5p_2 --"angry"--> 6npc2_2_angry[Bye bye]
5p_2 -- "happy/neutral" --> 6npc1_2_happy[Good luck Detective]
5p_2 -- "happy/neutral" --> 6npc2_2_happy[Yeah good luck]

5p_4 --"angry"--> 6npc1_4_angry[Alright, goodnight]
5p_4 --"angry"--> 6npc2_4_angry[...]
5p_4 -- "happy/neutral" --> 6npc1_4_happy[No worries]
5p_4 -- "happy/neutral" --> 6npc2_4_happy[Yeah, have a good night!]

5p_5 --"angry"--> 6npc1_5_angry[See you around]
5p_5 --"angry"--> 6npc2_5_angry[Goodnight Detective]
5p_5 -- "happy/neutral" --> 6npc1_5_happy[No worried]
5p_5 -- "happy/neutral" --> 6npc2_5_happy[See you around]


classDef player fill:#f96,stroke:#333,stroke-width:4px;
class 0p_1,0p_2,0p_3,1p_1,1p_2,1p_3,1p_4,1p_5,2p_1,2p_2,2p_3,2p_4,2p_5,3p_1,3p_2,3p_3,3p_4,3p_5,4p_1,4p_2,4p_3,4p_4,4p_5,5p_1,5p_2,5p_3,5p_4,5p_5, player

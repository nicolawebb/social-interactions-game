graph TD


start --> 0npc1[Umm...]
start --> 0npc2[Hello?]

0npc1 --> 0p_1[Good evening]
0npc1 --> 0p_2[Hello]
0npc1 --> 0p_3[...]

0p_1 --"angry"--> 1npc1_0_angry[Umm...]
0p_1  -- "happy" --> 1npc1_0_happy[Hey there]
0p_1  -- "happy" --> 1npc2_0_happy[Can we help you?]
0p_1  -- "neutral" --> 1npc1_0_neutral[Hello?]
0p_1  -- "neutral" --> 1npc2_0_neutral[Can we help?]

0p_2 --"angry"--> 1npc1_0_angry[Um...]
0p_2 -- "happy" --> 1npc1_0_happy[Hey]
0p_2 -- "happy" --> 1npc2_0_happy[Whats up?]
0p_2 -- "neutral" --> 1npc1_0_neutral[Hello?]
0p_2 -- "neutral" --> 1npc2_0_neutral[Can we help you?]


1npc1_0_angry --> 1p_1[I have a few questions to ask]
1npc1_0_angry --> 1p_2[You re gonna answer some questions for me]
1npc1_0_angry --> 1p_3[...]
1npc1_0_happy --> 1p_4[Do you have a moment to talk?]
1npc1_0_happy --> 1p_5[I need a moment of your time]
1npc1_0_happy --> 1p_3


1p_1 --"angry"--> 2npc1_1_angry[Sure...]
1p_1 -- "happy" --> 2npc1_1_happy[Sure we have time]
1p_1 -- "neutral" --> 2npc1_1_neutral[Okay we ll talk I guess]
1p_1 -- "neutral" --> 2npc2_1_neutral[Yeah whats up??]

1p_2 --"angry"--> 2npc1_2_angry[Sure...]
1p_2 -- "happy" --> 2npc1_2_happy[Sure we have time]
1p_2 -- "neutral" --> 2npc1_2_neutral[Okay we ll talk I guess]
1p_2 -- "neutral" --> 2npc2_2_neutral[Yeah whats up?] 

1p_4 --"angry"--> 2npc1_4_angry[Sure...]
1p_4 -- "happy" --> 2npc1_4_happy[Sure we can talk]
1p_4 -- "neutral" --> 2npc1_4_neutral[Okay we ll talk I guess]
1p_4 -- "neutral" --> 2npc2_4_neutral[Yeah whats up?] 

1p_5 --"angry"--> 2npc1_5_angry[Sure...]
1p_5 -- "happy" --> 2npc1_5_happy[Sure we can talk]
1p_5 -- "neutral" --> 2npc1_5_neutral[Okay we ll talk I guess]
1p_5 -- "neutral" --> 2npc2_5_neutral[Yeah whats up?]


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


2p_1 --"angry"--> 3npc1_1_angry[We went to the graveyard]
2p_1 -- "happy" --> 3npc1_1_happy[We hung out at the graveyard]
2p_1 -- "neutral" --> 3npc1_1_neutral[We were at the graveyard for a bit]

2p_2 --"angry"--> 3npc1_2_angry[At the graveyard? No.]
2p_2 -- "happy" --> 3npc1_2_happy[We were at the graveyard, we saw a few people there]
2p_2 -- "neutral" --> 3npc1_2_neutral[At the graveyard? I didnt see anything]

2p_4 --"angry"--> 3npc1_4_angry[We went to the graveyard]
2p_4 -- "happy" --> 3npc1_4_happy[We hung out at the graveyard]
2p_4 -- "happy" --> 3npc2_4_happy[Saw a few people there]
2p_4 -- "neutral" --> 3npc1_4_neutral[We were at the graveyard for a bit]

2p_5 --"angry"--> 3npc1_5_angry[We went to the graveyard]
2p_5 --"angry"--> 3npc2_5_angry[Saw a few people there]
2p_5 -- "happy" --> 3npc1_5_happy[We were at the graveyard for a bit]
2p_5 -- "happy" --> 3npc2_5_happy[We saw Sarah there I think?]
2p_5 -- "neutral" --> 3npc1_5_neutral[We were at the graveyard for a bit]
2p_5 -- "neutral" --> 3npc2_5_neutral[There were a few people there]



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


3p_1 --"angry"--> 4npc1_1_angry[SAw him yesterday, at the graveyard]
3p_1 -- "happy" --> 4npc1_1_happy[Saw him yesterday]
3p_1 -- "happy" --> 4npc2_1_happy[While we were at the graveyard]
3p_1 -- "neutral" --> 4npc1_1_neutral[We saw him last night]
3p_1 -- "neutral" --> 4npc2_1_neutral[At the graveyard]

3p_2 --"angry"--> 4npc1_2_angry[We saw him last night, at the graveyard]
3p_2 -- "happy" --> 4npc1_2_happy[We saw him last night]
3p_2 -- "happy" --> 4npc2_2_happy[While we were at the graveyard]
3p_2 -- "neutral" --> 4npc1_2_neutral[I saw him yesterday]
3p_2 -- "neutral" --> 4npc2_2_neutral[Yeah at the graveyard]

3p_4 --"angry"--> 4npc1_4_angry[Saw him yesterday, at the graveyard]
3p_4 -- "happy" --> 4npc1_4_happy[Saw him yesterday]
3p_4 -- "happy" --> 4npc2_4_happy[While we were at the graveyard]
3p_4 -- "neutral" --> 4npc1_4_neutral[We saw him at the graveyard]

3p_5 --"angry"--> 4npc1_5_angry[Saw him at the graveyard last night]
3p_5 -- "happy" --> 4npc1_5_happy[Yeah we saw him last night]
3p_5 -- "happy" --> 4npc2_5_happy[While we were at the graveyard]
3p_5 -- "neutral" --> 4npc1_5_neutral[We saw him last night]
3p_5 -- "neutral" --> 4npc2_5_neutral[At the graveyard]


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


4p_1 --"angry"--> 5npc1_1_angry[Sarah maybe?]
4p_1 -- "happy" --> 5npc1_1_happy[I heard Sarah? wasnt a big fan of his]
4p_1 -- "happy" --> 5npc2_1_happy[Yeah they argued a LOT]
4p_1 -- "neutral" --> 5npc1_1_neutral[I would say Sarah?]

4p_2 --"angry"--> 5npc1_2_angry[Sarah maybe?]
4p_2 -- "happy" --> 5npc1_2_happy[I heard Sarah? wasnt a big fan of his]
4p_2 -- "happy" --> 5npc2_2_happy[Yeah they argued a LOT]
4p_2 -- "neutral" --> 5npc1_2_neutral[I think Sarah maybe?]

4p_4 --"angry"--> 5npc1_4_angry[Sarah maybe?]
4p_4 -- "happy" --> 5npc1_4_happy[I heard Sarah? wasnt a big fan of his]
4p_4 -- "happy" --> 5npc2_4_happy[Yeah they argued a LOT]
4p_4 -- "neutral" --> 5npc1_4_neutral[Honestly? Sarah.]

4p_5 --"angry"--> 5npc1_5_angry[Sarah maybe?]
4p_5 -- "happy" --> 5npc1_5_happy[I heard Sarah? wasnt a big fan of his]
4p_5 -- "happy" --> 5npc2_5_happy[Yeah they argued a LOT]
4p_5 -- "neutral" --> 5npc1_5_neutral[I wanna say Sarah...]


5npc1_1_angry --> 5p_1[Alright thank you, bye]
5npc1_1_angry --> 5p_2[Thanks]
5npc1_1_angry --> 5p_3[...]
5npc1_1_happy --> 5p_4[You ve been a big help]
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


5p_1 --"angry"--> 6npc1_1_angry[Alright, see you around]
5p_1 --"angry"--> 6npc2_1_angry[Yeah, cya]
5p_1 -- "happy" --> 6npc1_1_happy[Best of luck]
5p_1 -- "happy" --> 6npc2_1_happy[Goodnight!]
5p_1 -- "neutral" --> 6npc1_1_neutral[Alright cya]
5p_1 -- "neutral" --> 6npc2_1_neutral[Yeah good luck]

5p_2 --"angry"--> 6npc1_2_angry[Alright, see you around]
5p_2 --"angry"--> 6npc2_2_angry[Yeah, cya]
5p_2 -- "happy" --> 6npc1_2_happy[Best of luck]
5p_2 -- "happy" --> 6npc2_2_happy[Goodnight!]
5p_2 -- "neutral" --> 6npc1_2_neutral[Good luck]
5p_2 -- "neutral" --> 6npc2_2_neutral[See you around]

5p_4 --"angry"--> 6npc1_4_angry[Alright, see you around]
5p_4 --"angry"--> 6npc2_4_angry[Yeah, cya]
5p_4 -- "happy" --> 6npc1_4_happy[Best of luck]
5p_4 -- "happy" --> 6npc2_4_happy[Goodnight!]
5p_4 -- "neutral" --> 6npc1_4_neutral[No worries]
5p_4 -- "neutral" --> 6npc2_4_neutral[See you around]

5p_5 --"angry"--> 6npc1_5_angry[Alright, see you around]
5p_5 --"angry"--> 6npc2_5_angry[Yeah, cya]
5p_5 -- "happy" --> 6npc1_5_happy[Best of luck]
5p_5 -- "happy" --> 6npc2_5_happy[Goodnight!]
5p_5 -- "neutral" --> 6npc1_5_neutral[Good luck]
5p_5 -- "neutral" --> 6npc2_5_neutral[See you]



classDef player fill:#f96,stroke:#333,stroke-width:4px;
class 0p_1,0p_2,0p_3,1p_1,1p_2,1p_3,1p_4,1p_5,2p_1,2p_2,2p_3,2p_4,2p_5,3p_1,3p_2,3p_3,3p_4,3p_5,4p_1,4p_2,4p_3,4p_4,4p_5,5p_1,5p_2,5p_3,5p_4,5p_5 player

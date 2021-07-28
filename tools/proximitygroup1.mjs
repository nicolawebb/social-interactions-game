graph TD


start --> 0npc1[Umm...]
start --> 0npc2[Hello?]

0npc1 --> 0p_1[Good evening]
0npc1 --> 0p_2[Hello]
0npc1 --> 0p_3[...]

0p_1 -- "happy" --> 1npc1_0_happy[How can we help you?]
0p_1 -- "neutral" --> 1npc1_0_neutral[Can we help you?]
0p_1 --"angry"--> 1npc1_0_angry[Uh you want something?]
0p_2 -- "happy" --> 1npc1_0_happy[How can we help you?]
0p_2 -- "neutral" --> 1npc1_0_neutral[Can we help you?]
0p_2 --"angry"--> 1npc1_0_angry[Uh you want something?]


1npc1_0_angry --> 1p_1[I have a few questions to ask]
1npc1_0_angry --> 1p_2[You re gonna answer some questions for me]
1npc1_0_angry --> 1p_3[...]
1npc1_0_happy --> 1p_4[Do you have a moment to talk?]
1npc1_0_happy --> 1p_5[I need a moment of your time]
1npc1_0_happy --> 1p_3


1p_1 --"angry"--> 2npc1_1_angry[Sure I guess]
1p_1 --"angry"--> 2npc2_1_angry[We can talk]
1p_1 -- "happy" --> 2npc1_1_happy[Of course!]
1p_1 -- "happy" --> 2npc2_1_happy[How can we help?]
1p_1 -- "neutral" --> 2npc1_1_neutral[Sure]
1p_1 -- "neutral" --> 2npc2_1_neutral[Yeah how can we help?]

1p_2 --"angry"--> 2npc1_2_angry[Jeez]
1p_2 --"angry"--> 2npc2_2_angry[We can talk]
1p_2 -- "happy" --> 2npc1_2_happy[Of course!]
1p_2 -- "happy" --> 2npc2_2_happy[How can we help?]
1p_2 -- "neutral" --> 2npc1_2_neutral[Sure]
1p_2 -- "neutral" --> 2npc2_2_neutral[Yeah how can we help?]

1p_4 --"angry"--> 2npc1_4_angry[Sure whatever]
1p_4 --"angry"--> 2npc2_4_angry[I guess...]
1p_4 -- "happy" --> 2npc1_4_happy[Sure we can talk to you]
1p_4 -- "happy" --> 2npc2_4_happy[What do you need from us?]
1p_4 -- "neutral" --> 2npc1_4_neutral[Sure we can talk I guess]
1p_4 -- "neutral" --> 2npc2_4_neutral[Yeah whats up?]

1p_5 --"angry"--> 2npc1_5_angry[Sure whatever]
1p_5 --"angry"--> 2npc2_5_angry[I guess...]
1p_5 -- "happy" --> 2npc1_5_happy[Sure we can help out]
1p_5 -- "neutral" --> 2npc1_5_neutral[Sure we can talk I guess]


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

2p_1 --"angry"--> 3npc1_1_angry[We don t have to talk to you]
2p_1 --"angry"--> 3npc2_1_angry[Not with that attitude]
2p_1 -- "happy" --> 3npc1_1_happy[We just went for a walk]
2p_1 -- "happy" --> 3npc2_1_happy[We didnt see much]
2p_1 -- "neutral" --> 3npc1_1_neutral[We weren t doing anything weird]

2p_2 --"angry"--> 3npc1_2_angry[We dont have to tell you]
2p_2 -- "happy" --> 3npc1_2_happy[We just went for a walk]
2p_2 -- "happy" --> 3npc2_2_happy[Sorry, we didnt see anything]
2p_2 -- "neutral" --> 3npc1_2_neutral[We just went for a walk]
2p_2 -- "neutral" --> 3npc2_2_neutral[We didn t see anything]

2p_4 --"angry"--> 3npc1_4_angry[Not much]
2p_4 -- "happy" --> 3npc1_4_happy[Last night was pretty uneventful]
2p_4 -- "neutral" --> 3npc1_4_neutral[We walked around for a bit]
2p_4 -- "neutral" --> 3npc2_4_neutral[Pretty uneventful]

2p_5 --"angry"--> 3npc1_5_angry[We weren t doing anything weird]
2p_5 -- "happy" --> 3npc1_5_happy[We went for a walk last night]
2p_5 -- "happy" --> 3npc2_5_happy[We didnt see much, sorry]
2p_5 -- "neutral" --> 3npc1_5_neutral[We walked around for a bit]
2p_5 -- "neutral" --> 3npc1_5_neutral[Didnt see much]


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


3p_1 --"angry"--> 4npc1_1_angry[I think I saw him going to the graveyard?]
3p_1 --"angry"-->4npc2_1_angry[Yeah  at around 10?]
3p_1 -- "happy" --> 4npc1_1_happy[I think I saw him going to the graveyard]
3p_1 -- "happy" --> 4npc2_1_happy[Around 10 last night]
3p_1 -- "neutral" --> 4npc1_1_neutral[He was at the graveyard]

3p_2 --"angry"--> 4npc1_2_angry[We don t have to tell you]
3p_1 --"angry"--> 4npc2_1_angry[We saw him at the graveyard...]
3p_2 -- "happy" --> 4npc1_2_happy[We saw him at the graveyard]
3p_2 -- "happy" --> 4npc2_2_happy[Around 10 last night?]
3p_2 -- "neutral" --> 4npc1_2_neutral[He was at the graveyard]
3p_2 -- "neutral" --> 4npc2_2_neutral[Around 10 last night]

3p_4 --"angry"--> 4npc1_4_angry[Maybe the graveyard? I don t know...]
3p_4 -- "happy" --> 4npc1_4_happy[I think I saw him going to the graveyard?]
3p_4 -- "happy" --> 4npc2_4_happy[Yeah  around 10?]
3p_4 -- "neutral" --> 4npc1_4_neutral[He was at the graveyard]
3p_4 -- "neutral" --> 4npc2_4_neutral[Yeah  around 10?]

3p_5 --"angry"--> 4npc1_5_angry[I think I saw him going to the graveyard?]
3p_5 -- "happy" --> 4npc1_5_happy[He might have been at the graveyard?]
3p_5 -- "neutral" --> 4npc1_5_neutral[We saw him go over to the graveyard]


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

4p_1 --"angry"--> 5npc1_1_angry[I don t think Sarah was too fond of him]
4p_1 -- "happy" --> 5npc1_1_happy[Perhaps Sarah wasnt his biggest fan...]
4p_1 -- "neutral" --> 5npc1_1_neutral[I don t think Sarah was too fond of him...]

4p_2 --"angry"--> 5npc1_2_angry[Sarah wasn t his biggest fan]
4p_2 --"angry"--> 5npc2_2_angry[Yeah they argued a lot]
4p_2 -- "happy" --> 5npc1_2_happy[Perhaps Sarah wasnt his biggest fan...]
4p_2 -- "neutral" --> 5npc1_2_neutral[I don t think Sarah was too fond of him...]

4p_4 --"angry"--> 5npc1_4_angry[Sarah didn t like him all that much]
4p_4 -- "happy" --> 5npc1_4_happy[Perhaps Sarah wasnt his biggest fan...]
4p_4 -- "neutral" --> 5npc1_4_neutral[I don t think Sarah was too fond of him...]

4p_5 --"angry"--> 5npc1_5_angry[Sarah wasn t his biggest fan]
4p_5 -- "happy" --> 5npc1_5_happy[Perhaps Sarah wasnt his biggest fan...]
4p_5 -- "neutral" --> 5npc1_5_neutral[I don t think Sarah was too fond of him...]

5npc1_1_angry --> 5p_1[Alright thank you]
5npc1_1_angry --> 5p_2[Thanks]
5npc1_1_angry --> 5p_3[...]
5npc1_1_happy --> 5p_4[You ve been a big help]
5npc1_1_happy --> 5p_5[Thank you guys see you around]
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


5p_1 --"angry"--> 6npc1_1_angry[Alright seeya]
5p_1 --"angry"--> 6npc2_1_angry[Bye]
5p_1 -- "happy" --> 6npc1_1_happy[Best of luck!]
5p_1 -- "happy" --> 6npc2_1_happy[Yeah good luck]
5p_1 -- "neutral" --> 6npc1_1_neutral[Okay catch you later]
5p_1 -- "neutral" --> 6npc2_1_neutral[Yeah bye now]

5p_2 --"angry"--> 6npc1_2_angry[Good luck...]
5p_2 --"angry"--> 6npc2_2_angry[...]
5p_2 -- "happy" --> 6npc1_2_happy[Best of luck!]
5p_2 -- "happy" --> 6npc2_2_happy[Yeah good luck]
5p_2 -- "neutral" --> 6npc1_2_neutral[Okay catch you later]
5p_2 -- "neutral" --> 6npc2_2_neutral[Yeah bye now]

5p_4 --"angry"--> 6npc1_4_angry[Alright seeya]
5p_4 --"angry"--> 6npc2_4_angry[Yeah bye]
5p_4 -- "happy" --> 6npc1_4_happy[Best of luck!]
5p_4 -- "happy" --> 6npc2_4_happy[Yeah good luck]
5p_4 -- "neutral" --> 6npc1_4_neutral[Okay catch you later]
5p_4 -- "neutral" --> 6npc2_4_neutral[Yeah bye now]

5p_5 --"angry"--> 6npc1_5_angry[Okay bye...]
5p_5 --"angry"--> 6npc2_5_angry[...]
5p_5 -- "happy" --> 6npc1_5_happy[Best of luck!]
5p_5 -- "happy" --> 6npc2_5_happy[Yeah good luck]
5p_5 -- "neutral" --> 6npc1_5_neutral[Okay catch you later]
5p_5 -- "neutral" --> 6npc2_5_neutral[Yeah bye now]


classDef player fill:#f96,stroke:#333,stroke-width:4px;
class 0p_1,0p_2,0p_3,1p_1,1p_2,1p_3,1p_4,1p_5,2p_1,2p_2,2p_3,2p_4,2p_5,3p_1,3p_2,3p_3,3p_4,3p_5,4p_1,4p_2,4p_3,4p_4,4p_5,5p_1,5p_2,5p_3,5p_4,5p_5 player

graph TD


start --> 0npc1[Umm...]
start --> 0npc2[Hello?]

0npc1 --> 0p_1[Good evening]
0npc1 --> 0p_2[Hello]
0npc1 --> 0p_3[...]

0p_1 --"angry"--> 1npc1_0_angry[Hello?]
0p_1  -- "happy" --> 1npc1_0_happy[Hi!]
0p_1  -- "happy" --> 1npc2_0_happy[Hello!]
0p_1  -- "neutral" --> 1npc1_0_neutral[Hi]
0p_1  -- "neutral" --> 1npc2_0_neutral[Hello]

0p_2 --"angry"--> 1npc1_0_angry[Hello?]
0p_2 -- "happy" --> 1npc1_0_happy[Hi!]
0p_2 -- "happy" --> 1npc2_0_happy[Hello!]
0p_2 -- "neutral" --> 1npc1_0_neutral[Hi]
0p_2 -- "neutral" --> 1npc2_0_neutral[Hello]


1npc1_0_angry --> 1p_1[I have a few questions to ask]
1npc1_0_angry --> 1p_2[You re gonna answer some questions for me]
1npc1_0_angry --> 1p_3[...]
1npc1_0_happy --> 1p_4[Do you have a moment to talk?]
1npc1_0_happy --> 1p_5[I need a moment of your time]
1npc1_0_happy --> 1p_3


1p_1 --"angry"--> 2npc1_1_angry[Sure...]
1p_1 --"angry"--> 2npc2_1_angry[What do you need to know?]
1p_1 -- "happy" --> 2npc1_1_happy[How can we help?]
1p_1 -- "happy" --> 2npc2_1_happy[Yeah what's up??]
1p_1 -- "neutral" --> 2npc1_1_neutral[Whats up?]
1p_1 -- "neutral" --> 2npc2_1_neutral[How can we help?]

1p_2 --"angry"--> 2npc1_2_angry[Sure...]
1p_2 --"angry"--> 2npc2_2_angry[What do you need to know?]
1p_2 -- "happy" --> 2npc1_2_happy[How can we help?]
1p_2 -- "happy" --> 2npc2_2_happy[Yeah what's up?] 
1p_2 -- "neutral" --> 2npc1_2_neutral[Whats up?]
1p_2 -- "neutral" --> 2npc2_2_neutral[Yeah what's up?] 

1p_4 --"angry"--> 2npc1_4_angry[Sure...]
1p_4 --"angry"--> 2npc2_4_angry[What do you need to know?]
1p_4 -- "happy" --> 2npc1_4_happy[How can we help?]
1p_4 -- "happy" --> 2npc2_4_happy[Yeah what's up?] 
1p_4 -- "neutral" --> 2npc1_4_neutral[Whats up?]
1p_4 -- "neutral" --> 2npc2_4_neutral[Yeah what's up?] 

1p_5 --"angry"--> 2npc1_5_angry[Sure...]
1p_5 --"angry"--> 2npc2_5_angry[What do you need to know?]
1p_5 -- "happy" --> 2npc1_5_happy[How can we help?]
1p_5 -- "happy" --> 2npc2_5_happy[Yeah what's up?]
1p_5 -- "neutral" --> 2npc1_5_neutral[Can we help?]
1p_5 -- "neutral" --> 2npc2_5_neutral[Yeah what's up?]


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


2p_1 --"angry"--> 3npc1_1_angry[We were just at home]
2p_1 -- "happy" --> 3npc1_1_happy[We just stayed at home]
2p_1 -- "happy" --> 3npc2_1_happy[Yeah we went to bed early too]
2p_1 -- "neutral" --> 3npc1_1_neutral[We were at home]
2p_1 -- "neutral" --> 3npc2_1_neutral[We didnt do much]

2p_2 --"angry"--> 3npc1_2_angry[We were just at home]
2p_2 -- "happy" --> 3npc1_2_happy[We were at home]
2p_2 -- "neutral" --> 3npc1_2_neutral[We didnt see anything]

2p_4 --"angry"--> 3npc1_4_angry[We were just at home]
2p_4 -- "happy" --> 3npc1_4_happy[We were at home]
2p_4 -- "happy" --> 3npc2_4_happy[Yeah we went to bed early too]
2p_4 -- "neutral" --> 3npc1_4_neutral[We didnt go out]
2p_4 -- "neutral" --> 3npc2_4_neutral[We just stayed at home]

2p_5 --"angry"--> 3npc1_5_angry[We were just at home]
2p_5 -- "happy" --> 3npc1_5_happy[We were at home]
2p_5 -- "neutral" --> 3npc1_5_neutral[We stayed at home]


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


3p_1 --"angry"--> 4npc1_1_angry[I saw him a couple days ago?]
3p_1 -- "happy" --> 4npc1_1_happy[We saw him a couple days ago]
3p_1 -- "happy" --> 4npc2_1_happy[Yeah not too recently]
3p_1 -- "neutral" --> 4npc1_1_neutral[Maybe saw him last a couple of days ago?]

3p_2 --"angry"--> 4npc1_2_angry[I saw him a couple days ago?]
3p_2 -- "happy" --> 4npc1_2_happy[We saw him a couple days ago]
3p_2 -- "happy" --> 4npc2_2_happy[Yeah not too recently]
3p_2 -- "neutral" --> 4npc1_2_neutral[I didnt see him yesterday]
3p_2 -- "neutral" --> 4npc2_2_neutral[Maybe a couple days ago?]

3p_4 --"angry"--> 4npc1_4_angry[Saw him last a couple days ago?]
3p_4 -- "happy" --> 4npc1_4_happy[We saw him a couple days ago]
3p_4 -- "happy" --> 4npc2_4_happy[Yeah not too recently]
3p_4 -- "neutral" --> 4npc1_4_neutral[A few days ago I think]

3p_5 --"angry"--> 4npc1_5_angry[Saw him a couple days ago?]
3p_5 -- "happy" --> 4npc1_5_happy[We saw him a couple days ago]
3p_5 -- "happy" --> 4npc1_5_happy[Yeah not too recently]
3p_5 -- "neutral" --> 4npc1_5_neutral[Last saw him a few days ago I think?]


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


4p_1 --"angry"--> 5npc1_1_angry[I have no idea]
4p_1 --"angry"--> 5npc2_1_angry[Sorry]
4p_1 -- "happy" --> 5npc1_1_happy[Not that we know of?]
4p_1 -- "happy" --> 5npc2_1_happy[Yeah sorry]
4p_1 -- "neutral" --> 5npc1_1_neutral[I dont think he had any]
4p_1 -- "neutral" --> 5npc2_1_neutral[Yeah not that I know of]

4p_2 --"angry"--> 5npc1_2_angry[I have no idea]
4p_2 --"angry"--> 5npc2_2_angry[Sorry]
4p_2 -- "happy" --> 5npc1_2_happy[Not that we know of?]
4p_2 -- "happy" --> 5npc2_2_happy[Yeah sorry]
4p_2 -- "neutral" --> 5npc1_2_neutral[I have no yeah]
4p_2 -- "neutral" --> 5npc2_2_neutral[Yeah me neither]

4p_4 --"angry"--> 5npc1_4_angry[I have no idea]
4p_4 --"angry"--> 5npc2_4_angry[Sorry]
4p_4 -- "happy" --> 5npc1_4_happy[Not that we know of?]
4p_4 -- "happy" --> 5npc2_4_happy[Yeah sorry]
4p_4 -- "neutral" --> 5npc1_4_neutral[I have no idea]
4p_4 -- "neutral" --> 5npc2_4_neutral[Me neither, sorry]

4p_5 --"angry"--> 5npc1_5_angry[I have no idea]
4p_5 --"angry"--> 5npc2_5_angry[Sorry]
4p_5 -- "happy" --> 5npc1_5_happy[Not that we know of?]
4p_5 -- "happy" --> 5npc2_5_happy[Yeah sorry]
4p_5 -- "neutral" --> 5npc1_5_neutral[I have no idea]
4p_5 -- "neutral" --> 5npc2_5_neutral[Same here, sorry]


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


5p_1 --"angry"--> 6npc1_1_angry[Alright]
5p_1 --"angry"--> 6npc2_1_angry[See you around]
5p_1 -- "happy" --> 6npc1_1_happy[Have a goodnight!]
5p_1 -- "happy" --> 6npc2_1_happy[Yeah goodnight!]
5p_1 -- "neutral" --> 6npc1_1_neutral[Okay, goodnight]
5p_1 -- "neutral" --> 6npc2_1_neutral[See ya]

5p_2 --"angry"--> 6npc1_2_angry[Alright]
5p_2 --"angry"--> 6npc2_2_angry[See you around]
5p_2 -- "happy" --> 6npc1_2_happy[Have a goodnight!]
5p_2 -- "happy" --> 6npc2_2_happy[Yeah goodnight!]
5p_2 -- "neutral" --> 6npc1_2_neutral[Alright, goodnight]
5p_2 -- "neutral" --> 6npc2_2_neutral[Goodnight]

5p_4 --"angry"--> 6npc1_4_angry[Alright]
5p_4 --"angry"--> 6npc2_4_angry[See you around]
5p_4 -- "happy" --> 6npc1_4_happy[Have a goodnight!]
5p_4 -- "happy" --> 6npc2_4_happy[Yeah goodnight!]
5p_4 -- "neutral" --> 6npc1_4_neutral[Okay, goodnight]
5p_4 -- "neutral" --> 6npc2_4_neutral[See you around]

5p_5 --"angry"--> 6npc1_5_angry[Alright]
5p_5 --"angry"--> 6npc2_5_angry[See you around]
5p_5 -- "happy" --> 6npc1_5_happy[Have a good night!]
5p_5 -- "happy" --> 6npc2_5_happy[Yeah goodnight!]
5p_5 -- "neutral" --> 6npc1_5_neutral[Alright, goodnight]
5p_5 -- "neutral" --> 6npc2_5_neutral[See ya]


classDef player fill:#f96,stroke:#333,stroke-width:4px;
class 0p_1,0p_2,0p_3,1p_1,1p_2,1p_3,1p_4,1p_5,2p_1,2p_2,2p_3,2p_4,2p_5,3p_1,3p_2,3p_3,3p_4,3p_5,4p_1,4p_2,4p_3,4p_4,4p_5,5p_1,5p_2,5p_3,5p_4,5p_5 player

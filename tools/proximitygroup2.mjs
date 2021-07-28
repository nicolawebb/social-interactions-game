graph TD

start --> 0npc1[Umm...]

0npc1 --> 0p_1[Good evening]
0npc1 --> 0p_2[Hello]
0npc1 --> 0p_3[...]

0p_1 --"angry"--> 1npc1_0_angry[...can I help you?]
0p_1  -- "happy" --> 1npc1_0_happy[Hello, can I help you?]
0p_1  -- "neutral" --> 1npc1_0_neutral[Can I help you?]

0p_2 --"angry"--> 1npc1_0_angry[What do you want?]
0p_2 -- "happy" --> 1npc1_0_happy[Hi, can I help you?]
0p_2 -- "neutral" --> 1npc1_0_neutral[Can I help you?]


1npc1_0_angry --> 1p_1[I have a few questions to ask]
1npc1_0_angry --> 1p_2[You re gonna answer some questions for me]
1npc1_0_angry --> 1p_3[...]
1npc1_0_happy --> 1p_4[Do you have a moment to talk?]
1npc1_0_happy --> 1p_5[I need a moment of your time]
1npc1_0_happy --> 1p_3


1p_1 --"angry"--> 2npc1_1_angry[Sure I guess...]
1p_1 -- "happy" --> 2npc1_1_happy[Yeah, sure thing]
1p_1 -- "neutral" --> 2npc1_1_neutral[Sure]

1p_2 --"angry"--> 2npc1_2_angry[Okay I guess..]
1p_2 -- "happy" --> 2npc1_2_happy[Ive got a few minutes to spare...]
1p_2 -- "neutral" --> 2npc1_2_neutral[Sure]

1p_4 --"angry"--> 2npc1_4_angry[Sure, whatever]
1p_4 -- "happy" --> 2npc1_4_happy[Sure, whats up?]
1p_4 -- "neutral" --> 2npc1_4_neutral[Sure]

1p_5 --"angry"--> 2npc1_5_angry[Sure, whatever]
1p_5 -- "happy" --> 2npc1_5_happy[Sure, whats up?]
1p_5 -- "neutral" --> 2npc1_5_neutral[Sure]
 

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

2p_1 --"angry"--> 3npc1_1_angry[I was...at home.]
2p_1 -- "happy" --> 3npc1_1_happy[I was...at home the whole night.]
2p_1 -- "neutral" --> 3npc1_1_neutral[I was...at home.]

2p_2 --"angry"--> 3npc1_2_angry[I don t know anything, okay?]
2p_2 -- "happy" --> 3npc1_2_happy[I was just at home...]
2p_2 -- "neutral" --> 3npc1_2_neutral[I really dont know anything...]

2p_4 --"angry"--> 3npc1_4_angry[I was at home okay?]
2p_4 -- "happy" --> 3npc1_4_happy[I was...at home the whole night.]
2p_4 -- "neutral" --> 3npc1_4_neutral[I was...at home.]

2p_5 --"angry"--> 3npc1_5_angry[Nothing much...]
2p_5 -- "happy" --> 3npc1_5_happy[I was just at home]
2p_5 -- "neutral" --> 3npc1_5_neutral[I was...at home.]


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


3p_1 --"angry"--> 4npc1_1_angry[Havent seen him.]
3p_1 -- "happy" --> 4npc1_1_happy[I dont remember, sorry!]
3p_1 -- "neutral" --> 4npc1_1_neutral[Im not sure]

3p_2 --"angry"--> 4npc1_2_angry[I dont know okay?]
3p_2 -- "happy" --> 4npc1_2_happy[I didnt see him, no]
3p_2 -- "neutral" --> 4npc1_2_neutral[I havent seen him]

3p_4 --"angry"--> 4npc1_4_angry[I dont know]
3p_4 -- "happy" --> 4npc1_4_happy[I dont think Ive seen him in a while]
3p_4 -- "neutral" --> 4npc1_4_neutral[I havent seen him]

3p_5 --"angry"--> 4npc1_5_angry[Didnt see him.]
3p_5 -- "happy" --> 4npc1_5_happy[No I didnt see him!]
3p_5 -- "neutral" --> 4npc1_5_neutral[I havent seen him]


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

4p_1 --"angry"--> 5npc1_1_angry[No one]
4p_1 -- "happy" --> 5npc1_1_happy[No, we all liked him...]
4p_1 -- "neutral" --> 5npc1_1_neutral[We all liked him...]

4p_2 --"angry"--> 5npc1_2_angry[No one]
4p_2 -- "happy" --> 5npc1_2_happy[No one, we all got on with him]
4p_2 -- "neutral" --> 5npc1_2_neutral[We all got on with him]

4p_4 --"angry"--> 5npc1_4_angry[I dont anyone]
4p_4 -- "happy" --> 5npc1_4_happy[I wouldn t think so!]
4p_4 -- "neutral" --> 5npc1_4_neutral[Im not sure]

4p_5 --"angry"--> 5npc1_5_angry[No one]
4p_5 -- "happy" --> 5npc1_5_happy[No one, we all got on with him]
4p_5 -- "neutral" --> 5npc1_5_neutral[We all liked him]


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


5p_1 --"angry"--> 6npc1_1_angry[Bye]
5p_1 -- "happy" --> 6npc1_1_happy[Have a good night]
5p_1 -- "neutral" --> 6npc1_1_neutral[Yeah goodbye]

5p_2 --"angry"--> 6npc1_2_angry[Okay, seeya]
5p_2 -- "happy" --> 6npc1_2_happy[See you around]
5p_2 -- "neutral" --> 6npc1_2_neutral[Best of luck]

5p_4 --"angry"--> 6npc1_4_angry[No problem]
5p_4 -- "happy" --> 6npc1_4_happy[You re welcome! Goodbye]
5p_4 -- "neutral" --> 6npc1_4_neutral[Goodbye]

5p_5 --"angry"--> 6npc1_5_angry[Bye...]
5p_5 -- "happy" --> 6npc1_5_happy[See you!]
5p_5 -- "neutral" --> 6npc1_5_neutral[Okay bye]


classDef player fill:#f96,stroke:#333,stroke-width:4px;
class 0p_1,0p_2,0p_3,1p_1,1p_2,1p_3,1p_4,1p_5,2p_1,2p_2,2p_3,2p_4,2p_5,3p_1,3p_2,3p_3,3p_4,3p_5,4p_1,4p_2,4p_3,4p_4,4p_5,5p_1,5p_2,5p_3,5p_4,5p_5 player

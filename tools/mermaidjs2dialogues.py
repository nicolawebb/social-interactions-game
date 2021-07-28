import sys
from lark import Lark, Transformer
import jinja2
from jinja2 import Environment, PackageLoader, select_autoescape
from jinja2.ext import Extension, loopcontrols
from pprint import pprint

mjs_grammar = r"""
    start: "graph" ("TD"|"LR") value*
    ?value: relation
          | classdef
          | classdecl

    relation: node edge node
    node: identifier LABEL?
    identifier: IDENTIFIER
    cssvalue: ("#"|"_"|LETTER|DIGIT)*

    string: (LETTER | DIGIT | "?" | "!" | "," | ".")+
    edge: (labelled_edge | DIRECTED_EDGE)
    labelled_edge: EDGE "\"" identifier "\"" DIRECTED_EDGE

    cssrule: identifier ":" cssvalue (","|";")
    classdef: "classDef" identifier (cssrule)+ cssrule
    classdecl: "class" (identifier ",")+ identifier identifier

    DIRECTED_EDGE: "-->"
    EDGE:"--"

    IDENTIFIER: /[_a-zA-Z0-9][\-\/_a-zA-Z0-9]*/
    LABEL: /\[[ _\-?!,'.a-zA-Z0-9]*\]/
    %import common.ESCAPED_STRING
    %import common.LETTER
    %import common.DIGIT
    %import common.NUMBER
    %import common.WS
    %ignore WS
"""
parser = Lark(mjs_grammar)


#
# start --> 0npc1[Umm...]
# 0p_2 --"angry"--> 1npc1_angry[Me too]
# => characters["npc1"] = {0:
#                            {"*": "Umm..."},
#                        1: {"angry": "Me too",
#                            "happy/neutral": "I beg your..."
#                            }
#                        }
#

characters = {}


class Node():

    START = "start"
    PLAYER = 'player'
    NPC_1 = 'npc 1'
    NPC_2 = 'npc 2'

    def __init__(self):

        self.id = None
        self.utterance = ""
        self.option_order = 0
        self.mood = None


    def update(self, params):

        self.id = params[0]
        self.process_id(self.id)

        if self.id == Node.START:
            return

        if len(params) > 1:
            self.utterance = str(params[1])[1:-1]

            if self.speaker == Node.PLAYER:
                self.store()

        return self

    def update_response_order(self, order):

        self.store(order)

    def store(self, order = 0):

        if self.speaker not in characters:
            characters[self.speaker] = {}

        if self.state not in characters[self.speaker]:
            characters[self.speaker][self.state] = {}

        if order not in characters[self.speaker][self.state]:
            characters[self.speaker][self.state][order] = {}


        if self.mood:
            characters[self.speaker][self.state][order][self.mood] = [self.utterance]
        else:
            characters[self.speaker][self.state][order].setdefault("*", [None, None, None, None, None])[self.option_order] = self.utterance

        return self

    def process_id(self, id):
        if id == Node.START:
            return
        self.state = int(id[0])
        if id[1] == 'p':
            self.speaker = Node.PLAYER
            self.option_order = int(id[3]) - 1
        elif id[1] == 'n':
            if id[4] == '1':
                self.speaker = Node.NPC_1
                self.mood = id.split("_")[-1] if "_" in id else None
            elif id[4] == '2':
                self.speaker = Node.NPC_2
                self.mood = id.split("_")[-1] if "_" in id else None
            else:
                raise("Invalid node name %s" % id)
        else:
            raise("Invalid node name %s" % id)



    def __repr__(self):
        if self.id == Node.START:
            return self.id
        return "(%s, stage %d -> <%s>)" % (self.speaker, self.state, self.utterance)


class MjsTransformer(Transformer):

    def __init__(self):
        self.nodes = {}


    def identifier(self, s):
        return s[0]
    def string(self, s):
        return s[0]

    def node(self, parts):

        id = parts[0]

        return self.nodes.setdefault(id, Node()).update(parts)


    def edge(self, parts):
        if hasattr(parts[0], 'type') and parts[0].type == 'DIRECTED_EDGE':
            return None
        else:
            return parts[0].children[1]

    def relation(self, rel):
        source, edge, target = rel

        if source and source.speaker == Node.PLAYER:
            opt_num = source.option_order
            target.update_response_order(opt_num)


        if edge:
            #print("%s -( %s )->  %s" % (source, edge, target))
            return source, edge, target
        else:
            #print("%s -> %s" % (source, target))
            return source, target


if __name__ == '__main__':
    #print(sys.argv, len(sys.argv))
    speakerList = []
    npcList = []
    playerList = []
    speechList = []
    emotionList = []
    singleLine = {}
    combowombo = []
    sugar = []

    with open(sys.argv[1],'r') as f:
        parsed = parser.parse(f.read())
        data = MjsTransformer().transform(parsed)

        # pprint(characters)
        #print("--------------------------------------------------")
        #print("--------------------------------------------------")


        templateFile = 'dialogue.tpl.gd'
        templateLoader = jinja2.FileSystemLoader(searchpath="./")
        templateEnvironment = jinja2.Environment(loader = templateLoader)
        template = templateEnvironment.get_template(templateFile)
        outputText = template.render(characters = characters)
        print(outputText)

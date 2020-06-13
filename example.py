import spacy
import sent2tree

nlp = spacy.load('en_core_web_lg')

doc = nlp('Slopes of bright green grassland lay above them.')

# spacy.displacy.serve(doc, style='dep')

sent = next(doc.sents)

tree = sent2tree.sentenceTree(sent)

tree.render()

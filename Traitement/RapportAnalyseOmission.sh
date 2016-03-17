#/usr/bash

#Ce fichier ne prend en compte que les cas d'omission de tâche dans les evenements
echo "Début du processus de création du modèle des possibles (étape 4)"

#---le modèle d'édition
#demande les informations pour executer le programme de création du modèle d'édition 
echo "fichier de symboles (.syms) ? "
read label

#compile le programme cpp de detection : remplacer les chemin pour mettre ceux où se trouve la librairie openFst
#g++ -std=c++11 -I ../../../EvaluationMaquetteMdT/VerifMaquettesMdTCogtool/testCpp/openfst-1.5.0/src/include creationModelEdition.cpp -L ../../../EvaluationMaquetteMdT/VerifMaquettesMdTCogtool/testCpp/openfst-1.5.0/src/lib -lfst -o myapp

#./myapp $label


echo "automate de tous les chemins valides avec omission (resultat étape4) ? "
read res

fstshortestpath $res | fstarcsort > chemin.fst 

echo "une trace valide avec vos evenements : "
fstprint --isymbols=$label --osymbols=$label chemin.fst
echo "lorsqu'il y a une transition eps/NXXX c'est qu'il manque un evenement correspondant à la tâche NXXX "
	
echo "Fin de l'analyse de la cohérence par omission (étape 5/5)"
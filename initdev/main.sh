#.!/bin/bash 




R=$1;   # Le nom de repertoire pour faire renter comme argument 
T=$2 ; # le  type du langage pour le projet qu'on souhaite choisir 
L=$3 ;  # le type de la licence.
G=$4 ; # argument git. 

cd
 
if [ -z $R ] # la condition pour verifier si le nom du repertoire est vide. 
	then  
        
               echo "Expected arguments, please check the help : *initdev –help" 
               #echo "Il faut revérifier si vous avez entrer le nom du repertoire"
               exit 0 

    	else 

		if [$R = "-help" ] #Le cas l'utilisateur veut acceder au Help à partir de initdev 
		
		then
 
				echo "— Name : initdev1.bash."
				echo "— Syntax : initdev.bash [ project name ] [ langage ] [ type de license ] [... || git ]"
				echo "— args :  project name : nom du projet; langage: C, C++, Py...etc; type de license: GPL ou MIT; " 
				echo "— author : Name: Narimane TAMZAIT / email: nermine.lili@hotmail.fr " 


		
		else if  [ -n "$T" ]  # Condition pour verifier si l'argument associer au type du langage est non vide

                      then 
              	      if [ $T= "-C" ] || [ $T = "-C++" ] || [ $T = "-Py" ] || [ $T = "-Latex" ] || [ $T = "-BEAMER" ] 
                	    then 
                            if [ -n "$L" ]  # Condition pour verifier si l'argument associer au type du license est non vide
                                 then 
                                 if [ $L = "GPL" ] || [ $L = "MIT" ]
                                    then 

                 			  mkdir -p $R;		 # creation d'un repertoire  (nom_projet)
                  			  cd $R ;      		 # acceder au reprtoire 
               			          touch main.$y; 	 #creer le fichier vide main
                   			  touch LICENSE ; 	 # creer le fichier vide LICENSE 
                                          touch Makefile ;	 # creer le fichier vide Makefile
	           if [ $T = "C" ] || [ $T = "C++" ] || [ $T = "Py" ] 
                   then 
                   echo " projet creer avec succes  ";
                   cp $HOME/initdev/sources/main.$T  $HOME/$R/main.$T ;  #Copier le fichier texte contenant le code minimal du langage demandé dans un fichier "main.*" dans le répertoire du projet
                   else  
                    if [ $T = "latex" ]
                   then 
                     cp $HOME/initdev/sources/latexMin.tex  $HOME/$R/main.$T; 
                     echo " projet creer avec succès " ;
                     else  
                     cp $HOME/initdev/sources/beamer.tex  $HOME/$R/main.$T; 
                     echo " projet creer avec succès ";
                    fi
                    fi
		    cp $HOME/initdev/licenses/$L  $HOME/$R/LICENSE ;      #  copier la license approprie  du fichier initdev vers un fichier LICENSE dans  le repertoire du projet 

 if [ -n "$G" ] && [ $G = "-git" ]         # si L'argument associé au GIT  est égal à "-git" et est bien sur non vide 
          then 
                    cp $HOME/initdev/gitignores/$T  $HOME/$R/.gitignore ;  #copier le fichier gitignores pout le type de languages selectionne precedement
                    git init; # executer le la commande 



fi 

fi
           else 
             echo "Uknown arguments, please chek the help:[initdev1.bash -help] " ;  
                 fi 
             else 
              echo "rm Expected arguments, please chek the help : [initdev1.bash -help] ";
               fi 

                  
                   else 
                   echo "Uknown arguments, please check the help:[initdev1.bash -help]" ;
                 fi
           else
            echo "rm Expected arguments, please check the help : [initdev1.bash –help]";
         fi 


      fi
  
  #Le projet se termine ici 





























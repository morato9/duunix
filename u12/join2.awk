#!/bin/awk -f
BEGIN{ druhy=0; zacatek=0; shoda=0;if (ARGC != 3) exit}
{ if (FNR == 1) #pusti prvni radek ze soubru
	if (zacatek == 0)
		{
		zacatek="1";
		tabulka[$1]=$2;
		}
	else
		{
		druhy="1"
		if (tabulka[$1] != "")
			if ($2 != "")
				{print(tabulka[$1] " " $2); shoda="1"}
		}
  else
 	if (druhy == "0")
		{
		tabulka[$1]=$2 #tvori hashovaci tabulku, klic je index.
		}
	else
		if  (tabulka[$1] != "") #vlozi index z druheho souboru a kontroluje zda je k nemu hodnota v prnim souboru
			if ($2 != "") #vylouci klice bez hodnoty z druheho souboru
                        	{print(tabulka[$1] " " $2); shoda="1"}
}
END{	if (druhy == 0) print("Nezadali jse pozadovany pocet argumentu")#zahlasi v pripade, kdyz nebude potrebny pocet souboru neboru nebo bude chzbet nejakz argument treba -f 
	if (shoda == 0) print("Nenašla se žádná shoda") #v pripade ze nenajde pro zadny z klicu hodnotu v prvnim a druhem souboru 
	}


!/bin/bash
szerzo="false"
dal="false"

getSzoveg() {
  szoveg=$(wget -qO- "https://api.lyrics.ovh/v1/$szerzo/$dal")
  tisztaSzoveg=`echo "$szoveg" | python3 -c "from __future__ import print_function; import sys, json; print(json.load(sys.stdin)['lyrics'])"`
  if [[ $tisztaSzoveg == "" ]]; then { 
    echo "Hiba! Ilyen dalszöveg nem található"; 
    return 1; 
    }; 
  else echo $szerzo "-tól/-től a(z) " $dal " című zenének a  dalszövege: "
  fi
}

while getopts "s:d" parameter; do
  case "$parameter" in
    s)
        szerzo="true"
        if [ "$(echo "$@" | grep -Eo "\-d")" == "-d" ]; then 
          dal="true";
	      fi 
        ;;
    d)
        dal="true"
        if [ "$(echo "$@" | grep -Eo "\-s")" == "-s" ]; then 
          szerzo="true";
      	fi
        ;;
    
  esac
done

if ($szerzo && ! $dal)  || ($dal && ! $szerzo); then 
  echo "Hiba! Mindket paraméter szükséges a dalszöveg megkereséséhez!"
  exit 1
elif $szerzo && $dal; then 
  dal=$(echo "$@" | grep -Eo "\-d [ a-z A-Z 0-9 . \ ]*[ -]?" | sed s/-d//g | sed s/-//g | sed s/^" "//g)
  if [[ $dal == "" ]]; then { 
    echo "Hiba! Ilyen című dal nem található!";
    exit 1; 
    };
  fi
  szerzo=$(echo "$@" | grep -Eo "\-s [ a-z A-Z 0-9 . \ ]*[ -]?" | sed s/-s//g | sed s/-//g | sed s/^" "//g)
  if [[ $szerzo == "" ]]; then { 
    echo "Hiba! Ilyen szerző nem található!"; 
    exit 1; 
    };
  fi
  getSzoveg
  echo "$tisztaSzoveg"
fi

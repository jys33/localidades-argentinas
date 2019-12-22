# https://github.com/Wolox/arg-localities
declare -A PROVINCES
PROVINCES['A']='Salta'
PROVINCES['B']='Buenos Aires'
PROVINCES['C']='Ciudad Aut\u00F3noma de Buenos Aires'
PROVINCES['D']='San Luis'
PROVINCES['E']='Entre R\u00EDos'
PROVINCES['F']='La Rioja'
PROVINCES['G']='Santiago del Estero'
PROVINCES['H']='Chaco'
PROVINCES['J']='San Juan'
PROVINCES['K']='Catamarca'
PROVINCES['L']='La Pampa'
PROVINCES['M']='Mendoza'
PROVINCES['N']='Misiones'
PROVINCES['P']='Formosa'
PROVINCES['Q']='Neuqu\u00E9n'
PROVINCES['R']='R\u00EDo Negro'
PROVINCES['S']='Santa Fe'
PROVINCES['T']='Tucum\u00E1n'
PROVINCES['U']='Chubut'
PROVINCES['V']='Tierra del Fuego'
PROVINCES['W']='Corrientes'
PROVINCES['X']='C\u00F3rdoba'
PROVINCES['Y']='Jujuy'
PROVINCES['Z']='Santa Cruz'

for i in A B C D E F G H J K L M N P Q R S T U V W X Y Z; do
   echo -e "  ## Processing province ${PROVINCES[${i}]}"
   text="{\"iso_31662\":\"AR-${i}\", \"provincia\":\"${PROVINCES[${i}]}\", \"localidades\":"
   text="${text}`curl -s 'https://www.correoargentino.com.ar/sites/all/modules/custom/ca_forms/api/wsFacade.php' \
   -H 'authority: www.correoargentino.com.ar' \
   -H 'accept: application/json, text/javascript, */*; q=0.01' \
   -H 'origin: https://www.correoargentino.com.ar' \
   -H 'x-requested-with: XMLHttpRequest' \
   -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36' \
   -H 'content-type: application/x-www-form-urlencoded; charset=UTF-8' \
   -H 'sec-fetch-site: same-origin' \
   -H 'sec-fetch-mode: cors' \
   -H 'referer: https://www.correoargentino.com.ar/formularios/cpa' \
   -H 'accept-encoding: gzip, deflate, br' \
   -H 'accept-language: es-419,es;q=0.9' \
   -H 'cookie: has_js=1; _ga=GA1.3.345226047.1577014138; _gid=GA1.3.675613933.1577014138; _gat=1' \
   --data "action=localidades&localidad=none&calle=&altura=&provincia=${i}" --compressed`}"

   echo '    ## Saving current province localities...'
   text=$(echo ${text} | tr -cd '\11\12\15\40-\176')
   CURRENT_FILE=$(echo -e "por-provincia/${PROVINCES[${i}]}.json" | tr -d '[:space:]')
   echo ${text} | jq '.' | cat > ${CURRENT_FILE}
   echo '    ## [DONE]'

   # Append current province localities to full json
   if [ -z "${full_json}" ]; then
     full_json="[${text}"
   else
     full_json="${full_json},${text}"
   fi
   echo "  ## [DONE]"
done

echo '## [DONE]'

echo '## Saving all localities per province...'
full_json="${full_json}]"

rm -f arg-localidades.json
echo ${full_json} | jq '.' | cat > arg-localidades.json
echo '## [DONE]'
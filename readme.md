## Simples script para instalação do Cursor Editor
Esse script baixa o appimage do cursor diretamete da fonte original e seu icone. Em seguida, ele faz a instalação do appimage na pasta ```/usr/bin``` sendo renomeado para cursor. Também adiciona o cursor.desktop a pasta ``` /usr/share/applications/ ``` para ele aparecer no menu de programas

## Formas de uso
Para instalação (primeira instalação do cursor), use: ```./install.sh```. 

Caso você já tenha o cursor instalado no ```/usr/bin```, use no lugar: ```./install.sh --force```

## Bom uso
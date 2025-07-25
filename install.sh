#!/bin/env bash

cursor_tmp_dir="/tmp/cursor_installer"
cursor_path="$cursor_tmp_dir/cursor"
cursor_icon_path="$cursor_tmp_dir/cursor.png"

cursor_dest_path="/usr/bin/cursor"
cursor_dest_icon_path="/usr/share/icons/hicolor/256x256/apps/cursor.png"
cursor_dest_desktop_path="/usr/share/applications/cursor.desktop"


#depois de um tempo vou trocar a url de download do cursor quando tiver novas versões
cursor_icon_url="https://registry.npmmirror.com/@lobehub/icons-static-png/1.56.0/files/light/cursor.png"
cursor_download_url="https://downloads.cursor.com/production/a8e95743c5268be73767c46944a71f4465d05c90/linux/x64/Cursor-1.2.4-x86_64.AppImage"

cursor_desktop_code="[Desktop Entry]
Name=Cursor
Comment=Code Editor with AI
Comment[pt_BR]=Editor de Código com IA Integrada
Exec=$cursor_dest_path
Icon=$cursor_dest_icon_path
Terminal=false
Type=Application
Categories=Development;IDE;
Keywords[pt_BR]=Desenvolvimento;IDE;
StartupNotify=true
"

function install_cursor() {
    if ! command -v wget &> /dev/null; then
        echo "wget não está instalado, instale e tente novamente."
        exit 1
    fi

    if [ -f "$cursor_dest_path" ] && [ "$1" != "--force" ]; then
        echo "Cursor já está instalado em $cursor_dest_path"
        echo "Use --force para reinstalar."
        exit 0
    fi

    mkdir -p "$cursor_tmp_dir"
    wget -O "$cursor_tmp_dir/cursor.AppImage" "$cursor_download_url"
    mv "$cursor_tmp_dir/cursor.AppImage" "$cursor_path"
    wget -O "$cursor_icon_path" "$cursor_icon_url"

    sudo cp "$cursor_path" "$cursor_dest_path" && sudo chmod +x "$cursor_dest_path"
    sudo cp "$cursor_icon_path" "$cursor_dest_icon_path"
    echo "$cursor_desktop_code" | sudo tee "$cursor_dest_desktop_path" > /dev/null
}

install_cursor "$1"

#!/bin/bash

echo "initializing php-fpm ..."
/usr/sbin/php-fpm8.2 -D
echo "php-fpm initialized!"

echo "[*] Verifying webp format support in PHP..."

php -r 'echo "[WebP Support] => "; var_export(gd_info()["WebP Support"] ?? false); echo PHP_EOL;'

if php -r 'exit(gd_info()["WebP Support"] ? 0 : 1);'; then
  echo "[✔] PHP with webp support active !"
else
  echo "[✘] PHP withou any webp support. Check dockerfile!"
fi

echo "[*] Testando suporte real do GD para thumbnails..."

for ext in jpg png webp; do
  SRC="/var/www/html/wp-content/uploads/testes/imagem_teste.$ext"
  DEST="/var/www/html/wp-content/uploads/testes/thumb_teste_$ext.$ext"

  if [ ! -f "$SRC" ]; then
    echo "❌ Arquivo não encontrado: $SRC"
    continue
  fi

  echo -n "[*] $ext... "

  case $ext in
    jpg)
      php -r "if (@\$im = imagecreatefromjpeg('$SRC')) imagejpeg(\$im, '$DEST', 80);"
      ;;
    png)
      php -r "if (@\$im = imagecreatefrompng('$SRC')) imagepng(\$im, '$DEST', 6);"
      ;;
    webp)
      php -r "if (@\$im = imagecreatefromwebp('$SRC')) imagewebp(\$im, '$DEST', 80);"
      ;;
  esac

  if [ -f "$DEST" ]; then
    echo "✅ OK ($DEST)"
  else
    echo "❌ Falhou ao gerar thumbnail"
  fi
done
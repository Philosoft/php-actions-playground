#!/bin/sh
set -e

echo "##### PHP Lint Action #####"

PHP_VERSION=$(php -r "echo phpversion();")

if [ -z "$1" ]; then
  DIR_TO_SCAN="."
else
  DIR_TO_SCAN="$1"
fi

echo ":: Running PHP Syntax Checker (lint) on ${DIR_TO_SCAN}"
echo ":: PHP Version : ${PHP_VERSION}"

if [ ! -d "${DIR_TO_SCAN}" ] && [ ! -f "${DIR_TO_SCAN}" ]; then
  echo "\nInvalid directory or file: ${DIR_TO_SCAN}"

  exit 2
fi

EXIT_CODE=0
for file in $(find ${DIR_TO_SCAN} -type f -name "*.php" ! -path "./vendor/*"); do
  RESULT=$(php -l ${file} || true)

  if [ "${RESULTS}" != "No syntax errors detected in ${file}" ]; then
    echo "\n${RESULT}\n"
    EXIT_CODE=1
  fi
done

exit "${EXIT_CODE}"

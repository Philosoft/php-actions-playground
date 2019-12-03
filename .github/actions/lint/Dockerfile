FROM php:7.3-cli-alpine

LABEL version="7.3"
LABEL repository="https://github.com/Philosoft/action-php-lint"
LABEL homepage="https://github.com/Philosoft/action-php-lint"
LABEL maintainer="Aleksandr Frolov <thephilosoft@gmail.com>"

COPY "entrypoint.sh" "/entrypoint.sh"

RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

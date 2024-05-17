# checkov:skip=CKV_DOCKER_3 We're not adding a user
# checkov:skip=CKV_DOCKER_7 We're just following latest.
FROM amazon/dynamodb-local

LABEL maintainer="Matthew Baggett <matthew@baggett.me>" \
      org.label-schema.vcs-url="https://github.com/benzine-framework/docker-dynamodb" \
      org.opencontainers.image.source="https://github.com/benzine-framework/docker-dynamodb"

HEALTHCHECK --interval=5s --timeout=3s --start-period=0s --retries=5 \
    CMD curl --silent --output /dev/null http://localhost:8000/shell/

CMD ["-jar", "/home/dynamodblocal/DynamoDBLocal.jar", "-inMemory"]

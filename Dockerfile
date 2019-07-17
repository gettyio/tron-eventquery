FROM frolvlad/alpine-java:jdk8-full

ENV TRON_PATH=/opt/tron

WORKDIR ${TRON_PATH}

USER root

# adds tron user and fix tron folder's permission
RUN	adduser -S tron -u 1000 -G root \
    && chown -R tron:root ${TRON_PATH}

USER tron

COPY --chown=tron:root target/troneventquery-1.0.0-SNAPSHOT.jar ${TRON_PATH}/

COPY --chown=tron:root config.conf ./

ENTRYPOINT [ "java" ]
CMD [ "-jar", "troneventquery-1.0.0-SNAPSHOT.jar" ]
FROM aursu/systemdbuild:7-base

COPY rpmmacros ${BUILD_HOME}/.rpmmacros
COPY SOURCES ${BUILD_TOPDIR}/SOURCES
COPY SPECS ${BUILD_TOPDIR}/SPECS

RUN chown -R $BUILD_USER ${BUILD_TOPDIR}/{SOURCES,SPECS}

# https://github.com/systemd/systemd/issues/9666
ENV TRAVIS true

USER $BUILD_USER
CMD /usr/bin/rpmbuild -ba systemd.spec


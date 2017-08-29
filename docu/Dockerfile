FROM nfnty/arch-mini

# add haskell-core repo, for pandoc
RUN echo -e "[haskell-core]\nServer = http://xsounds.org/~haskell/core/\$arch\n\n" >> /etc/pacman.conf
RUN pacman-key -r 4209170B
RUN pacman-key --lsign-key 4209170B

RUN pacman -Sy --noconfirm awk haskell-pandoc-tool git python make ttf-linux-libertine ghostscript fig2dev texlive-latexextra texlive-fontsextra

# clean package cache
RUN paccache -rfk0

RUN mkdir /gitlab
ENV HOME=/gitlab

# All builds will be done in home dir
WORKDIR $HOME

CMD ["/bin/bash"]

FROM nfnty/arch-mini

# add haskell-core repo, for pandoc
RUN echo -e "[haskell-core]\nServer = http://xsounds.org/~haskell/core/\$arch\n\n" >> /etc/pacman.conf
ENV HASKELL_KEY=90513750A418C0FE
RUN gpg --keyserver hkp://keyserver.ubuntu.com:80 --homedir /etc/pacman.d/gnupg --recv-keys $HASKELL_KEY
RUN pacman-key --lsign-key $HASKELL_KEY

RUN pacman -Sy --noconfirm awk haskell-pandoc-tool git python python-pandocfilters make ttf-linux-libertine ghostscript fig2dev texlive-latexextra texlive-fontsextra

# clean package cache
RUN paccache -rfk0

RUN mkdir /gitlab
ENV HOME=/gitlab

# All builds will be done in home dir
WORKDIR $HOME

CMD ["/bin/bash"]

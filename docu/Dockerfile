FROM antergos/archlinux-base-devel

RUN pacman -Syyu --noconfirm python pandoc ttf-linux-libertine texlive-most ghostscript fig2dev

RUN mkdir /gitlab
ENV HOME=/gitlab

# All builds will be done in home dir
WORKDIR $HOME

CMD ["/bin/bash"]

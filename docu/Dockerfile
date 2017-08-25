FROM antergos/archlinux-base-devel

RUN pacman -Syyu pandoc texlive-most fig2dev

# All builds will be done in home dir
WORKDIR $HOME

CMD ["/bin/bash"]

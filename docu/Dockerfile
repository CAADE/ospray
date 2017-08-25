FROM antergos/archlinux-base-devel

RUN pacman -Syyu --noconfirm pandoc texlive-most fig2dev

RUN mkdir /gitlab
ENV HOME=/gitlab

# All builds will be done in home dir
WORKDIR $HOME

CMD ["/bin/bash"]

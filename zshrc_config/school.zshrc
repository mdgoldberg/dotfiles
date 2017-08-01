# frosh
alias frosh="cd $HOME/Dropbox/Frosh"
alias cs51="cd $HOME/Dropbox/Frosh/CS51/"
alias cs61="cd $HOME/Dropbox/Frosh/CS61/"
# soph
alias soph="cd $HOME/Dropbox/Soph"
alias cs121="cd $HOME/Dropbox/Soph/CS121/cs121_psets/"
alias am121="cd $HOME/Dropbox/Soph/AM121/am121_psets/"
alias stat110="cd $HOME/Dropbox/Soph/'Stat 110'/stat110_psets/"
alias stat111="cd $HOME/Dropbox/Soph/'Stat 111'/stat111_psets/"
alias cs124="cd $HOME/Dropbox/Soph/CS124/cs124_psets"
alias cs181="cd $HOME/Dropbox/Soph/CS181/"
# jr
alias jr="cd $HOME/Dropbox/Junior"
alias cs134="cd $HOME/Dropbox/Junior/CS134"
alias cs109="cd $HOME/Dropbox/Junior/CS109"
alias stat131="cd $HOME/Dropbox/Junior/Stat131"
alias cs182="cd $HOME/Dropbox/Junior/CS182"
alias cs136="cd $HOME/Dropbox/Junior/CS136"
# sr
alias sr="cd $HOME/Dropbox/Senior"
alias mcb112="cd $HOME/Dropbox/Senior/mcb112"
alias psy1401="cd $HOME/Dropbox/Senior/psy1401"
alias stat120="cd $HOME/Dropbox/Senior/stat120"
alias tf_cs182="cd $HOME/Dropbox/Senior/cs182"
alias stat149="cd $HOME/Dropbox/Senior/stat149"
alias stat220="cd $HOME/Dropbox/Senior/stat220"
alias thesis="cd $HOME/Dropbox/Senior/goldberg_thesis/nba_lineup_evaluation"

# jr - cs161
export CS161_DIR="$HOME/Dropbox/Junior/CS161"
alias cs161="cd $CS161_DIR"
alias os161="cd $CS161_DIR/os161"
alias root161="cd $CS161_DIR/root"
alias debug161="cd $CS161_DIR/root > /dev/null; sys161 -w kernel"
alias gdb161="cd $CS161_DIR/root > /dev/null; mips-harvard-os161-gdb kernel"

# auto-build os161 kernel
function fullbuild161() {
    if [[ -z "$1" ]]; then
        echo "usage: build161 asst_num";
        return;
    fi

    orig_cwd=$(pwd);
    cd "$CS161_DIR/os161/kern/conf" > /dev/null
    ./config "ASST$1"
    cd "$CS161_DIR/os161/kern/compile/ASST$1" > /dev/null
    bmake depend
    bmake
    bmake install
    cd "$orig_cwd" > /dev/null;
}

# auto-build os161 kernel (doesn't run ./config ASST#)
function build161() {
    if [[ -z "$1" ]]; then
        echo "usage: build161 asst_num";
        return;
    fi

    orig_cwd=$(pwd);
    cd "$CS161_DIR/os161/kern/compile/ASST$1" > /dev/null
    bmake depend
    bmake
    bmake install
    cd "$orig_cwd" > /dev/null;
}

# auto-build userland for 161
function ubuild161() {
    orig_cwd=$(pwd);
    cd "$CS161_DIR/os161/userland" > /dev/null
    bmake depend
    bmake
    bmake install
    cd "$orig_cwd" > /dev/null
}

# run sys161, mounting an SFS volume immediately
function run161() {
  cd $CS161_DIR/root > /dev/null;
  sys161 "$@" kernel "mount sfs lhd1";
}

# dump the SFS journal
function dumpsfs161() {
    orig_cwd=$(pwd);
    cd "$CS161_DIR/root" > /dev/null;
    hostbin/host-dumpsfs "$@" LHD1.img;
    cd "$orig_cwd" > /dev/null;
}

# check the SFS volume's consistency
function sfsck161() {
    orig_cwd=$(pwd);
    cd "$CS161_DIR/root" > /dev/null;
    hostbin/host-sfsck LHD1.img;
    cd "$orig_cwd" > /dev/null;
}

# clean the SFS volume
function wipesfs161() {
    orig_cwd=$(pwd);
    cd "$CS161_DIR/root" > /dev/null;
    hostbin/host-mksfs LHD1.img mydisk;
    cd "$orig_cwd" > /dev/null;
}

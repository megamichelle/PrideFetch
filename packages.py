from subprocess import check_output

commands = [
    "pacman -Qq",
    "apt list --installed",
    "yum list installed",
    "dnf list installed",
    "qlist -I",
    "nix-store -qR /run/current-system/sw",
]

def get_num_packages() -> (int, bool):
    for command in commands:
        try:
            return len(check_output(command.split(" ")).decode("utf-8").split("\n")) - 1
        except FileNotFoundError:
            pass
    return False
